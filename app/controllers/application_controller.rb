require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  post '/posts' do
    @post = Post.create(params)
    redirect '/posts'
  end

  get '/posts/new' do
    @post = Post.new
    erb :'posts/new'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'posts/edit'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'posts/show'
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :'posts/deleted'
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :'posts/show'
  end

end
