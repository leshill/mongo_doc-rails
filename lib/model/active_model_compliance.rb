require 'rubygems'

require 'active_model/naming'

require 'active_model/deprecated_error_methods'
require 'active_model/errors'

module MongoDoc
  module Model
    
    module ActiveModelCompliance
      # Replace this with your own validations.
      def valid?
        true
      end

      def destroyed?
        _id.nil?
      end
      
      def errors
        @errors ||= ActiveModel::Errors.new(self)
      end
      
      def self.included(doc_class)
        doc_class.extend ActiveModel::Naming
      end
    end
    
  end
end