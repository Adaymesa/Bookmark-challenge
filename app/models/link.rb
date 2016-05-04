require "data_mapper"
require "dm-postgres-adapter"
require "pg"

class Link

	include DataMapper::Resource

	property :id, Serial
	property :url, String
	property :title, String
end
require 'data_mapper'

DataMapper.setup(:default, ENV['https://bookmark123.herokuapp.com/'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
