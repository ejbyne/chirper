class Chirp

  include DataMapper::Resource

  property :id,           Serial
  property :message,      Text
  property :created_at,   String

  belongs_to  :user

end