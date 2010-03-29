require 'model/active_model_compliance'

module MongoDoc
  module Model
    def self.included(document_class)
      document_class.class_eval %{
        include MongoDoc::Document
        include MongoDoc::Model::ActiveModelCompliance
      }
    end
  end
end
