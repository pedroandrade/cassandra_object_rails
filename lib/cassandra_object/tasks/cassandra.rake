namespace :cassandra do

  desc 'Creates the keyspace in config/cassandra.yml for the current environment'
  task create: :environment do
    begin
      CassandraObject::Schema.create_keyspace cassandra_config.keyspace, cassandra_config.keyspace_options
    rescue Exception => e
      if e.message =~ /conflicts/
        p "Keyspace #{cassandra_config.keyspace} already exists"
      else
        raise e
      end
    end
  end

  desc 'Drops the keyspace in config/cassandra.yml for the current environment'
  task drop: :environment do
    begin
      CassandraObject::Schema.drop_keyspace cassandra_config.keyspace
    rescue Exception => e
      if e.message =~ /non existing keyspace/
        p "Keyspace #{cassandra_config.keyspace} does not exist"
      else
        raise e
      end
    end
  end

  task reset: [:drop, :setup]
  task setup: [:create, :load]

  task dump: :environment do
    filename = ENV['SCHEMA'] || "#{Rails.root}/db/cassandra/structure.cql"
    File.open(filename, "w:utf-8") do |file|
      CassandraObject::Schema.dump(file)
    end
  end

  task load: :environment do
    filename = ENV['SCHEMA'] || "#{Rails.root}/db/cassandra/structure.cql"
    File.open(filename) do |file|
      CassandraObject::Schema.load(file)
    end
  end

  private
    def cassandra_config
      @cassandra_config ||= begin
        cassandra_configs = YAML.load_file(Rails.root.join('config', 'cassandra.yml'))
        CassandraObject::Config.new cassandra_configs[Rails.env || 'development']
      end
    end
end
