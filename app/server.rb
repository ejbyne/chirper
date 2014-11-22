require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chirper_#{env}")
require_relative '../lib/user'
DataMapper.finalize
DataMapper.auto_migrate!

class Chirper < Sinatra::Base

  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :"/sessions/new"
  end

  get '/users/new' do
    @user = User.new
    erb :"/users/new"
  end

  post '/users' do
    @user = User.create( user_name:              params[:user_name],
                        first_name:             params[:first_name],
                        last_name:              params[:last_name],
                        email:                  params[:email],
                        email_confirmation:     params[:email_confirmation],
                        password:               params[:password],
                        password_confirmation:  params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
