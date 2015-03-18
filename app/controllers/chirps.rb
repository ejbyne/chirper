class Chirper

  get '/chirps/new' do
    if current_user
      erb :"chirps/new"
    else
      flash[:errors] = ["You must log in to add a chirp"]
      redirect to('/')
    end
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

end
