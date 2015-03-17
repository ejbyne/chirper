require 'data_mapper'
require './app/data_mapper_setup'

task :auto_upgrade do
  DataMapper.setup(:default, "postgres://localhost/chirper_test")
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do
  DataMapper.setup(:default, "postgres://localhost/chirper_test")
  DataMapper.auto_migrate!
  puts "Auto-migrate complete (data could have been lost)"
end
