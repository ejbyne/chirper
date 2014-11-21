require 'sinatra/base'

class Chirper < Sinatra::Base

  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :"/sessions/new"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
