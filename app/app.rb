require 'sinatra/base'
require './app/models/link'


class BookMarkMgr < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:index)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end