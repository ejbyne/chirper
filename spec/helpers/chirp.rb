module ChirpHelpers

  def add_chirp(message, user_id)
    Chirp.create( message:      message,
                  user_id:      user_id,
                  created_at:   time = Time.now)
  end

end
