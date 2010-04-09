require 'mongo_doc/active_model/active_model_compliance'
require 'mongo_doc/active_model/validations'

module MongoDoc
  module ActiveModel
    VERSION = '0.2.0'

    def self.included(klass)
      klass.class_eval do
        include MongoDoc::Document
        include MongoDoc::ActiveModel::ActiveModelCompliance
        extend MongoDoc::ActiveModel::Validations::ClassMethods
      end
    end
  end
end
