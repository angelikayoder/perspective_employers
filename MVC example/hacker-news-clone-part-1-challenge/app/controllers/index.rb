get '/' do
  @posts = Post.all.order(:created_at)
  erb :'posts/index'
end
