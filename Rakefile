require 'active_record'
require 'yaml'
require 'logger'

MIGRATIONS_DIR = 'migrate/'
CONF = YAML.load_file('database.yml')
ActiveRecord::Base.configurations = CONF
ActiveRecord::Base.establish_connection(:default)
ActiveRecord::Base.logger = Logger.new(STDOUT)

desc 'Migrate the database'
task :migrate do
  ActiveRecord::Migrator.migrate(MIGRATIONS_DIR, ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end

desc 'Create the database'
task :create do
  %x( MYSQL_PWD=#{CONF['default']['password']} mysql --user=#{CONF['default']['username']} -e "create DATABASE #{CONF['default']['database']} DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci" )
end

desc 'Drop the database'
task :drop do
  %x( MYSQL_PWD=#{CONF['default']['password']} mysql --user=#{CONF['default']['username']} -e "DROP DATABASE #{CONF['default']['database']}" )
end

desc 'Setup the database'
task setup: [:create, :migrate]
