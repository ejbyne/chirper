class Reply

  include DataMapper::Resource

  property :id,           Serial
  property :message,      Text
  property :created_at,   Time

  belongs_to    :chirp
  belongs_to    :user

end
