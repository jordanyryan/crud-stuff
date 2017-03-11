get '/channels/:id' do
  @channel = Channel.find(params[:id])
  erb :'channels/show'
end

post '/channels/:id/subscribe' do
  subscription = Subscription.new(user_id: session[:user_id], channel_id: params[:id])
  subscription.save
  redirect "/channels/#{params[:id]}"
end

post '/channels/:id/unsubscribe' do
  subscription = Subscription.find_by(user_id: session[:user_id], channel_id: params[:id])
  if subscription
    subscription.destroy
  end
  redirect "/channels/#{params[:id]}"

end
