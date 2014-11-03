# Index Page - Show All
get '/' do
  # @posts = Post.all
  @posts = Post.all
  # @posts = PostVote.all.posts.order(  count :desc)

  erb :'posts/index'
end