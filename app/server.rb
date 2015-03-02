require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chirper_#{env}")
require_relative '../lib/user'
require_relative '../lib/chirp'
DataMapper.finalize
DataMapper.auto_migrate!

class Chirper < Sinatra::Base

  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    @chirps = Chirp.all
    @users = User.all
    erb :index
  end

  get '/sessions/new' do
    erb :"/sessions/new"
  end

  post '/sessions' do
    user_name, password = params[:user_name], params[:password]
    user = User.authenticate(user_name, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ["The username or password is incorrect"]
      erb :"sessions/new"
    end
  end

  get '/sessions/end' do
    erb :"/sessions/end"
  end

  post '/sessions/keep' do
    flash[:notice] = "Not signed out"
    redirect to('/')
  end

  delete '/sessions' do
    flash[:notice] = "Good bye!"
    session[:user_id] = nil
    redirect to('/')
  end

  get '/users/new' do
    @user = User.new
    erb :"/users/new"
  end

  post '/users' do
    @user = User.create(user_name:              params[:user_name],
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

  get '/chirps/new' do
    erb :"chirps/new"
  end

  post '/chirps' do
    @chirp = Chirp.create(message:              params[:message],
                          user_id:              current_user.id,
                          created_at:           Time.now)
    if @chirp.save
      redirect to('/')
    else
      flash.now[:errors] = @chirp.errors.full_messages
      erb :"chirps/new"
    end
  end

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def find_chirper(chirp)
      User.get(chirp.user_id)
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
