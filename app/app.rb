ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  # get '/' do
  #   erb :index
  # end

  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/links' do
    Link.create( title: params[:title], url: params[:url])
    redirect '/links'
  end

  get '/links/new' do
    erb :new
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
