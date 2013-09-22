module CassandraObject

  class RailsInitializer

    def self.configure!
      self.new.configure!
    end

    def configure!
      return if cassandra_configs.nil?
      CassandraObject::Config.new cassandra_configs[Rails.env || 'development']
    end

    private

      def cassandra_configs
        @config ||= cassandra_configs = YAML.load_file(Rails.root.join('config', 'cassandra.yml'))
      rescue Errno::ENOENT, NoMethodError
      end

  end
end
