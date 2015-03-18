require 'spec_helper'
require_relative 'helpers/user'
require_relative 'helpers/chirp'

include UserHelpers
include ChirpHelpers

describe Chirp do

  it 'is created with a message, the name of the maker, their user handle and the time created' do
    user = add_user
    expect(Chirp.count).to eq(0)
    add_chirp("Hello I am Roger", user.id)
    expect(Chirp.count).to eq(1)
    chirp = Chirp.first
    expect(chirp.message).to eq("Hello I am Roger")
    expect(chirp.user_id).to eq(user.id)
    expect(chirp.created_at).not_to be(nil)
  end

  it 'does not create a chirp if no user id is available' do
    expect(Chirp.count).to eq(0)
    Chirp.create( message:      "Hello",
                  created_at:   time = Time.now)
    expect(Chirp.count).to eq(0)
  end

end
