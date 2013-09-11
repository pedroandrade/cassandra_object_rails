require 'yaml'
module CassandraObject

  class RailsInitializer

    def self.configure!
      self.new.configure!
    end

    def configure!
      validate_config
      CassandraObject::Base.config(config_hash)
    end

    private

      def config_hash
        @config ||= YAML.load_file("#{Rails.root.to_s}/config/cassandra.yml")[Rails.env]
      end

      def validate_config
        ['keyspace', 'servers'].each do |key|
          if config_hash[key].blank?
            raise CassandraObject::InvalidConfiguration,
              "Missing config for key: #{key}"
          end
        end
        config_hash
      end
  end
end
