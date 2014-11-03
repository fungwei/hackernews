post '/votes/posts' do
  PostVote.create(user_id: session[:user_id], post_id: params[:post_id])

  redirect '/'
end