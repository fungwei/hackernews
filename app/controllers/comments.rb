post '/comments' do
  post = Post.find(params[:post_id])

  post.comments.build(user_id: session[:user_id], content: params[:comment])
  post.save
  redirect "/posts/#{params[:post_id]}"

end