module Helpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def find_author(message)
    User.get(message.user_id)
  end

  def chirp_replies(chirp_id)
    Reply.all(:chirp_id => chirp_id, :order => [ :created_at.desc ])
  end

  def formatted_creation_time(message)
    message.created_at.strftime("at %l:%M%P on %d.%m.%Y")
  end

end
