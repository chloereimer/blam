require "rails_helper"

RSpec.describe Weapon, type: :model do
  it "has a valid factory" do
    expect(build(described_class_symbol)).to be_valid
  end
end
