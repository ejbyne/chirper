class Chirper

  get '/' do
    @chirps = Chirp.all
    @users = User.all
    erb :index
  end

end
