# Index Page - Show All
get '/' do
  @posts = Post.all
  @posts = Post.order("posts.created_at desc")

  redirect '/'
end

# User Profile - Show All Posts
get '/posts' do
  posts_array = []
  @user = User.find_by(id: session[:user_id])
  @posts_array = @user.posts.order("posts.created_at desc")

  erb :'/users/show'
end


# Create New Post
post '/posts/new' do
  user = User.find_by(id: session[:user_id])
  new_post = Post.create(post: params[:post], user_id: user.id)

  redirect '/users'
end

# Delete Post
delete '/posts' do
  Post.find(params[:id]).destroy
  redirect '/posts'
end