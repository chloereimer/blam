require "rails_helper"

RSpec.describe Element, type: :model do
  it "is implemented" do
    expect(Element).to eq(Element)
  end

  it "implements an Element::Base class" do
    expect(Element::Base).to eq(Element::Base)
  end

  it "implements an Element::CanApplyStatusEffect module" do
    expect(Element::CanApplyStatusEffect).to eq(Element::CanApplyStatusEffect)
  end

  describe "Element::Base" do
    it "responds to self.damage_multiplier_against" do
      expect(Element::Base).to respond_to(:damage_multiplier_against)
    end
  end

  describe "Element::CanApplyStatusEffect" do
    let(:extended_class) { Class.new { extend Element::CanApplyStatusEffect } }

    it "provides self.damage_multiplier_against to classes that extend it" do
      expect(extended_class).to respond_to(:status_effect_duration_in_seconds)
    end
  end
end
