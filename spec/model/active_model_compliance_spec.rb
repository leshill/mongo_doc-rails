require 'spec_helper'

class ActiveModelComplianceTest
  include MongoDoc::Model
end

describe MongoDoc::Model do
  let(:model) { ActiveModelComplianceTest.new }

  describe "#to_param" do
    let(:string_id) { mock }

    before(:each) do
      model.instance_variable_set(:@_id, mock(:oid, :to_s => string_id))
    end

    it "returns the string form of the document id" do
      model.to_param.should == string_id
    end
  end

  describe "#valid?" do
    subject { model }
    it "responds to #valid?" do
      should respond_to(:valid?)
    end
  end

  describe "#new_record?" do
    subject { model }
    it "responds to #new_record?" do
      should respond_to(:new_record?)
    end

    context "when the object has an id" do
      before(:each) do
        model.instance_variable_set(:@_id, mock(:id))
      end

      it "is false" do
        should_not be_new_record
      end
    end

    context "when the object has no id" do
      before(:each) do
        model.instance_variable_set(:@_id, nil)
      end

      it "is true" do
        should be_new_record
      end
    end
  end

  describe "#destroyed?" do
    subject { model }

    it "responds to #destroyed?" do
      should respond_to(:destroyed?)
    end

    context "when the object has an id" do
      before(:each) do
        model.instance_variable_set(:@_id, mock(:id))
      end

      it "is false" do
        should_not be_destroyed
      end
    end

    context "when the object has no id" do
      before(:each) do
        model.instance_variable_set(:@_id, nil)
      end

      it "is true" do
        should be_destroyed
      end
    end
  end

  describe "#errors" do
    subject { model }
    it "responds to errors" do
      should respond_to(:errors)
    end

    describe "#[]" do
      it "returns an array on a missing key lookup" do
        model.errors[:does_not_exist].should be_an(Array)
      end
    end

    describe "#full_messages" do
      it "returns an array" do
        model.errors.full_messages.should be_an(Array)
      end
    end
  end

  describe ".model_name" do
    it "responds to model_name" do
      ActiveModelComplianceTest.should respond_to(:model_name)
    end

    it "is a string" do
      ActiveModelComplianceTest.model_name.should be_a(String)
    end

    it "has a human inflector" do
      ActiveModelComplianceTest.model_name.human.should be_a(String)
    end

    it "has a partial path inflector" do
      ActiveModelComplianceTest.model_name.partial_path.should be_a(String)
    end

    it "has a singular inflector" do
      ActiveModelComplianceTest.model_name.singular.should be_a(String)
    end

    it "has a plural inflector" do
      ActiveModelComplianceTest.model_name.plural.should be_a(String)
    end
  end
end
