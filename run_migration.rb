require 'active_record'
require 'yaml'
require 'logger'

# Load database configuration
db_config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(db_config['development'])

# Set up logger
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Run migrations
ActiveRecord::MigrationContext.new('db/migrate', ActiveRecord::SchemaMigration).migrate
