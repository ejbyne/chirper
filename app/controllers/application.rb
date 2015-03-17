class Chirper < Sinatra::Base

  include Helpers

  set :views, Proc.new { File.join(root, "..", "views") }
  set :public_folder, Proc.new { File.join(root, "..", "..", "public") }
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  run! if app_file == $0
  
end
