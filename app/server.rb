require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chirper_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!

class Chirper < Sinatra::Base

  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :"/sessions/new"
  end

  get '/users/new' do
    erb :"/users/new"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
