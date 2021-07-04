require "rails_helper"

RSpec.describe IsElementValidator do
  # custom validator testing pattern from https://stackoverflow.com/a/62259142
  subject { IsElementValidator.new({attributes: {foo: :bar}}) }
  let(:errors) { ActiveModel::Errors.new(OpenStruct.new) }
  let(:record) { instance_double(ActiveModel::Validations, errors: errors) }

  it "does not add errors when value is a subclass of Element" do
    expect {
      subject.validate_each(record, :element, Element::Incendiary)
    }.to_not change(errors, :count)
  end

  context "when the value is a class other than Element or its subclasses" do
    it "adds to the error count" do
      expect {
        subject.validate_each(record, :element, Weapon)
      }.to change(errors, :count)
    end

    it "adds the expected error message" do
      expect {
        subject.validate_each(record, :element, Weapon)
      }.to change { errors.messages }.to({element: ["is not a subclass of Element::Base"]})
    end
  end
end
