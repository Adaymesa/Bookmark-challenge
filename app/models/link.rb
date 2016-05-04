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

DataMapper.setup(:default, ENV['postgres://oxtufilzwfrzpw:XjIOlyydVY_EnvUOxigwPXYNv6@ec2-107-20-174-127.compute-1.amazonaws.com:5432/d85t2n534b7lea'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
