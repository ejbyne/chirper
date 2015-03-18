env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chirper_#{env}")
require_relative 'models/user'
require_relative 'models/chirp'
require_relative 'models/reply'
DataMapper.finalize
DataMapper.auto_upgrade!
