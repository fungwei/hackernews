# Index Page - Show All
get '/' do
  @posts = Post.all
  @posts = Post.order("posts.created_at desc")

  erb :'posts/index'
end