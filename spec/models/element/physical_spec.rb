require "rails_helper"

RSpec.describe Element::Physical, type: :model do
  describe ".damage_multiplier_against" do
    it "responds" do
      expect(described_class).to respond_to(:damage_multiplier_against)
    end

    it "returns 1.0 for :flesh" do
      expect(described_class.damage_multiplier_against(:flesh)).to eq(1.0)
    end

    it "returns 1.0 for :shield" do
      expect(described_class.damage_multiplier_against(:shield)).to eq(1.0)
    end

    it "returns 0.8 for :armor" do
      expect(described_class.damage_multiplier_against(:armor)).to eq(0.8)
    end
  end
end
