require 'mongo_doc/model/active_model_compliance'

module MongoDoc
  module Model
    def self.included(klass)
      klass.class_eval do
        include MongoDoc::Document
        include MongoDoc::Model::ActiveModelCompliance
      end
    end
  end
end
