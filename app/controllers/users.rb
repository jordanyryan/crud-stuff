enable :sessions


get '/users/login' do
  erb :'/users/login'
end

get '/users/signup' do
  erb :'/users/signup'
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])
  @channels = @user.channels
  erb :'/users/show'
end

post '/users/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["invalid email/password"]
    erb :'/users/login'
  end
end

post '/users/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :'/users/signup'
  end
end


