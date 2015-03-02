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
  property :user_name,        String,   unique: true
  property :first_name,       String
  property :last_name,        String
  property :email,            String,   unique: true
  property :password_digest,  Text

  has n,   :chirps,    :through => Resource

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, password)
    user = first(user_name: user_name)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end