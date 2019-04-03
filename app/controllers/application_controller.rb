class ApplicationController < Sinatra::Base

  require 'pry'

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all 
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    Recipe.create(params)
    redirect to '/recipes'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  
  patch '/recipes/:id' do
    binding.pry
  end

end