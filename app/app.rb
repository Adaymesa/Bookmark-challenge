require 'sinatra/base'
require 'tilt/erb'

class W4BookmarkManager < Sinatra::Base
  get '/links' do
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    Link.create(title: "Google", url: "www.google.com")
    redirect to('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
