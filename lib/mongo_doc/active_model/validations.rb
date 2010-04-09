module MongoDoc
  module ActiveModel
    module Validations
      module ClassMethods
        def validates_embedded(*attr_names)
          validates_with ValidatesEmbedded, _merge_attributes(attr_names)
        end
      end

      class ValidatesEmbedded < ::ActiveModel::EachValidator
        def validate(record)
          attributes.each do |attr|
            record.errors.add(attr) unless record.send(attr).valid?
          end
        end
      end
    end
  end
end
