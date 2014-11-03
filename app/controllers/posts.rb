use Rack::Flash

get '/posts/new' do
  @user = User.find_by(id: session[:user_id])
  erb :'posts/new'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/show'
end


# Create New Post
post '/posts' do
  @user = User.find_by(id: session[:user_id])
  puts @user.inspect
  @temp_post = @user.posts.build(params[:post])
  if @temp_post.save
    redirect "/posts/#{@temp_post.id}"
  else
    erb :'posts/new'

  end
end

# Delete Post
delete '/posts' do
  Post.find(params[:id]).destroy
  redirect '/posts'
end