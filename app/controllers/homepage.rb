class Chirper

  get '/' do
    @chirps = Chirp.all(:order => [ :created_at.desc ])
    @users = User.all
    erb :index
  end

end
