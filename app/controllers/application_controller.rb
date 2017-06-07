require_relative '../../config/environment'
require "pry"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts'do
    Post.create(name: params[:post][:name], content: params[:post][:content])
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id/edit' do
    @post = Post.all.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.all.find(params[:id])
    Post.update(params[:id], name: params[:name], content: params[:edited_content])
    redirect "/posts/#{params[:id]}"
  end

  get '/posts/:id' do
    @post = Post.all.find(params[:id])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post_name = Post.find(params[:id]).name
    Post.destroy(params[:id])
    erb :delete
  end

end
