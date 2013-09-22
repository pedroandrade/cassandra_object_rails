module CassandraObject

  class RailsInitializer

    def self.configure!
      self.new.configure!
    end

    def configure!
      return if cassandra_configs.nil?
      CassandraObject::Base.config = cassandra_configs[Rails.env || 'development']
    end

    def cassandra_configs
      @config ||= YAML.load_file(Rails.root.join('config', 'cassandra.yml'))
    end

  end
end
