require 'bcrypt'

class User

  include DataMapper::Resource

  validates_uniqueness_of :user_name
  validates_uniqueness_of :email
  attr_accessor :email_confirmation
  validates_confirmation_of :email
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id,               Serial
  property :user_name,        String,   unique: true,   message: "This username is already taken"
  property :first_name,       String
  property :last_name,        String
  property :email,            String,   unique: true,   message: "This email is already taken"
  property :password_digest,  Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end