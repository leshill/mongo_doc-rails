require 'active_model'

module MongoDoc
  module Model

    module ActiveModelCompliance
      def destroyed?
        _id.nil?
      end

      def self.included(klass)
        klass.class_eval do
          include ActiveModel::Validations
          extend ActiveModel::Naming
        end
      end
    end

  end
end
