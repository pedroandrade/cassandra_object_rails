require 'yaml'
require 'errors'
require 'base'
module CassandraObject

  class RailsInitializer

    def self.configure!
      self.new.configure!
    end

    def configure!
      return if config_hash.nil?
      CassandraObject::Base.config(config_hash)
    end

    private

      def config_hash
        @config ||= YAML.load_file("#{Rails.root.to_s}/config/cassandra.yml")[Rails.env]
      rescue Errno::ENOENT, NoMethodError
      end

  end
end
