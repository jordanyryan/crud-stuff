def current_user
  @current_user = User.find_by(id: session[:user_id])
end

def logged_in
  !!current_user
end

def subscribed
  @subscribed = Subscription.where("user_id = ? AND channel_id = ?", session[:user_id], @channel.id  )
end

def subscribe
  !subscribed.empty?
end

def user_tpm
  @channels.inject(0) {|total, channel| total + channel.price_per_month.to_f}.round(2)
end
