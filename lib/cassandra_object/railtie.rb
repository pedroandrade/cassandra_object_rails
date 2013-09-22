module CassandraObject
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'cassandra_object/tasks/ks.rake'
    end

    initializer 'my_railtie.configure_rails_initialization' do |app|
      RailsInitializer.configure!
    end
  end
end
