module CassandraObject

  class CasssandraObjectError < StandardError; end
  class InvalidConfiguration  < CasssandraObjectError; end
  class RecordNotSaved        < CasssandraObjectError; end
  class RecordNotFound        < CasssandraObjectError; end
end
