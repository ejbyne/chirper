require 'sinatra/base'

class Chirper < Sinatra::Base
  get '/' do
    'Hello Chirper!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
