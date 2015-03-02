module UserHelpers

  def add_user
    User.create(  user_name:              "roger_t",
                  first_name:             "Roger",
                  last_name:              "Test",
                  email:                  "test@test.com",
                  email_confirmation:     "test@test.com",
                  password:               "test",
                  password_confirmation:  "test")
  end

end
