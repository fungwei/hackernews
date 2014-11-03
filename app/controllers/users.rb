# Create Users & Authenticate Log In Page
get '/login' do
  erb :'sessions/new'
end


get '/users/:id' do
  @user = User.find(params[:id])


  erb :'users/show'
end

# Create Users & Authenticate Log In
post '/users' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], username: params[:username], password: params[:password], about_me: params[:about])
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
      flash[:notice] = "Wrong Password"
      erb :'sessions/new'
    end
  else
    flash[:notice] = "No such user exists"
    erb :'sessions/new'
  end
end


# Log Out
delete '/logout' do
  session.clear
  redirect '/?logout_success'
end