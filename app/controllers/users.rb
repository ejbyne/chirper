class Chirper

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

end