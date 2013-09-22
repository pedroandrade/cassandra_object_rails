require 'bundler/setup'
require 'minitest/autorun'
Bundler.require(:default, :test)

require 'support/connect'
require 'support/teardown'
require 'support/issue'

module CassandraObject
  class TestCase < ActiveSupport::TestCase
    def temp_object(&block)
      Class.new(CassandraObject::Base) do
        self.column_family = 'Issues'
        string :force_save
        before_save { self.force_save = 'junk' }

        def self.name
          'Issue'
        end

        instance_eval(&block) if block_given?
      end
    end
  end

  module Types
    class TestCase < CassandraObject::TestCase
      attr_accessor :coder
      setup do
        @coder = self.class.name.sub(/Test$/, '').constantize.new
      end
    end
  end
end
