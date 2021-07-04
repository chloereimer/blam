require "rails_helper"

RSpec.describe Element::Incendiary, type: :model do
  describe ".damage_multiplier_against" do
    it "responds" do
      expect(described_class).to respond_to(:damage_multiplier_against)
    end

    it "returns 1.75 for :flesh" do
      expect(described_class.damage_multiplier_against(:flesh)).to eq(1.75)
    end

    it "returns 0.5 for :shield" do
      expect(described_class.damage_multiplier_against(:shield)).to eq(0.5)
    end

    it "returns 0.5 for :armor" do
      expect(described_class.damage_multiplier_against(:armor)).to eq(0.5)
    end
  end

  describe ".status_effect_duration_in_seconds" do
    it "responds" do
      expect(described_class).to respond_to(:status_effect_duration_in_seconds)
    end

    it "returns a status effect duration of 5" do
      expect(described_class.status_effect_duration_in_seconds).to eq(5)
    end
  end
end
