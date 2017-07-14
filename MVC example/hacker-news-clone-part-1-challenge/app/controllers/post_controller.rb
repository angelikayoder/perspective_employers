get '/posts/new' do
  erb :'/posts/new'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'/posts/show'
end

#This updates the body of the post by overwriting it
get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :'/posts/edit'
end

# Must delete the comments associated with the post as well or they will get orphaned. Comments have to be destroyed BEFORE the post is destroyed or they can't be traced.
post '/posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.comments.destroy_all
  @post.destroy
  redirect "/"
end

post '/posts' do
  @post = Post.new(user_id: session[:user_id], post_body: params[:post_body])
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    @errors = ["Oops!"]
    erb :'/posts/new'
  end
end
# had to change this method from PUT to POST because forms won't allow put as method in html
post '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attribute(:post_body, params[:post_body])

  erb :"/posts/show"
end

post '/posts/:post_id/comments' do
  @post = Post.find(params[:post_id])

  @comment = Comment.new(
    user_id: session[:user_id],
    post_id: params[:post_id],
    comment_body: params[:comment_body]
  )
  if @comment.save
    redirect "/posts/#{params[:post_id]}"
  else
    @errors = ["Oops!"]
    erb :'/posts/show'
  end
end

post '/posts/:post_id/comments/:comment_id/delete' do
  @comment = Comment.find(params[:comment_id])
  @comment.destroy
  redirect "/posts/#{params[:post_id]}"
end
