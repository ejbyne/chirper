class Chirper

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

end
