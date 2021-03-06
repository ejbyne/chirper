class Chirp

  include DataMapper::Resource

  property :id,           Serial
  property :message,      Text
  property :created_at,   Time

  belongs_to  :user
  has n,      :replies,    :through => Resource

end
