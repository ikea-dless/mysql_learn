require 'active_record'
require 'mysql2'
require 'ffaker'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:default)

class Message < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

1000.times{User.create!(name: FFaker::Name.name)}
10000.times{Message.create!(text: FFaker::Lorem.sentence, user_id: Random.rand(1..500))}
