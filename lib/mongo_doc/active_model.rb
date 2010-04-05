require 'mongo_doc/active_model/active_model_compliance'

module MongoDoc
  module ActiveModel
    VERSION = '0.2.0'

    def self.included(klass)
      klass.class_eval do
        include MongoDoc::Document
        include MongoDoc::ActiveModel::ActiveModelCompliance
      end
    end
  end
end
