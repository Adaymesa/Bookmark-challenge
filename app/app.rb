require 'sinatra/base'

class W4BookmarkManager < Sinatra::Base
  get '/list' do
    'Hello w4-bookmark_manager!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
