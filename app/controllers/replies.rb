class Chirper

  get '/chirps/:chirp_id/replies/new' do
    if current_user
      @reply = Reply.new
      @chirp_id = params[:chirp_id]
      erb :"/replies/new"
    else
      flash[:errors] = ["You must log in to reply to a chirp"]
      redirect to('/')
    end
  end

  post '/chirps/:chirp_id/replies' do
    @reply = Reply.create(message:              params[:message],
                          user_id:              current_user.id,
                          chirp_id:             params[:chirp_id],
                          created_at:           Time.now)
    if @reply.save
      redirect to('/')
    else
      flash.now[:errors] = @reply.errors.full_messages
      erb :"replies/new"
    end
  end

end
