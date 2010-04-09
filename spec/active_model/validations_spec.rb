require 'spec_helper'

describe MongoDoc::ActiveModel::Validations do

  class ValidationTest
    extend MongoDoc::ActiveModel::Validations::ClassMethods
  end

  it "has the validates_embedded macro" do
    ValidationTest.should respond_to(:validates_embedded)
  end

  describe MongoDoc::ActiveModel::Validations::ValidatesEmbedded do
    let(:embedded) { stub(:null_object => true) }
    let(:record) { stub(:name => embedded, :errors => stub(:null_object => true)) }
    let(:validator) { MongoDoc::ActiveModel::Validations::ValidatesEmbedded.new(:attributes => :name) }

    it "checks the validity of the named attribute" do
      embedded.should_receive :valid?
      validator.validate(record)
    end

    it "adds an invalid error if the named attribute is not valid" do
      embedded.should_receive(:valid?).and_return(false)
      record.errors.should_receive(:add).with(:name)
      validator.validate(record)
    end
  end
end
