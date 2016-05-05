ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'bcrypt'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag_list = params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :new
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
     password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end






  post '/welcome' do
   #check email is correct --> helper  (email_correct?) returns boolean
   password = BCrypt::Password.create(params[:password])
   user = User.new(email: params[:email], password: password)
   user.save
   redirect '/welcome'

  end

  get '/welcome' do
    erb :welcome
  end




  # start the server if ruby file executed directly
  run! if app_file == $0
end
