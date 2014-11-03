# Create Users & Authenticate Log In Page
get '/sessions/new' do
  erb :'sessions/new'
end

# Create Users & Authenticate Log In
post '/sessions/new' do
  if params[:submit] == "create"
    User.create(username: params[:username], password: params[:password])
    redirect "/?notice=success"
  else
    # byebug
    if User.valid?(params[:username])
      new_user = User.find_by(username: params[:username])

      if new_user.authenticate(params[:password])
        session[:user_id] = new_user.id
        redirect "/posts"
      else
        redirect "/?notice=wrong_password"
      end
    else
      redirect "/?notice=no_account"
    end
  end
end


# Log Out
delete '/users/logout' do
  session.clear
  redirect '/?logout_success'
end