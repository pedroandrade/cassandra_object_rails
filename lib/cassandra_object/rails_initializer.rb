module CassandraObject

  class RailsInitializer

    def self.configure!
      self.new.configure!
    end

    def configure!
      return if cassandra_configs.nil?
      CassandraObject::Base.config = cassandra_configs[Rails.env || 'development']
    end

    private

      def cassandra_configs
        @config ||= YAML.load_file("#{Rails.root.to_s}/config/cassandra.yml")[Rails.env]
      end

  end
end
