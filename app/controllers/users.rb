# Create Users & Authenticate Log In Page
get '/login' do
  erb :'sessions/new'
end


# Create Users & Authenticate Log In
post '/users' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], username: params[:username], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :'sessions/new'
  end
end

post '/sessions' do
  if User.valid?(params[:username])
    new_user = User.find_by(username: params[:username])

    if new_user.authenticate(params[:password])
      session[:user_id] = new_user.id
      redirect "/"
    else
      @error = "Wrong Password"
      erb :'sessions/new'
    end
  else
    @error = "No such user exists"
    erb :'sessions/new'
  end
end


# Log Out
delete '/users/logout' do
  session.clear
  redirect '/?logout_success'
end