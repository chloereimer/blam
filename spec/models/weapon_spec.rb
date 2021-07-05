require "rails_helper"

RSpec.describe Weapon, type: :model do
  describe "weapon factory" do
    it "is valid by default" do
      expect(build(described_class_symbol)).to be_valid
    end

    it "is valid with a :with_status_effect trait" do
      weapon = build(described_class_symbol, :with_status_effect)
      expect(weapon).to be_valid
    end

    describe "when passed a :with_status_effect trait" do
      it "sets a status_effect_element" do
        weapon = build(described_class_symbol, :with_status_effect)
        expect(weapon.status_effect_element).to be_truthy
      end

      it "sets a status_effect_damage" do
        weapon = build(described_class_symbol, :with_status_effect)
        expect(weapon.status_effect_damage).to be_truthy
      end

      it "sets a status_effect_chance" do
        weapon = build(described_class_symbol, :with_status_effect)
        expect(weapon.status_effect_chance).to be_truthy
      end
    end
  end

  it "orders on created_at" do
    create(described_class_symbol, id: "ffffffff-ffff-ffff-ffff-ffffffffffff", created_at: 2.days.ago)
    create(described_class_symbol, id: "00000000-0000-0000-0000-000000000000")
    expect(described_class.last).to eq(described_class.order(:created_at).last)
  end

  describe "attributes" do
    it "has a default ammo_consumed_per_shot of 1.0" do
      expect(described_class.new.ammo_consumed_per_shot).to eq(1.0)
    end

    it "has a default element of Element::Physical" do
      expect(described_class.new.element).to eq(Element::Physical)
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      expect(build(described_class_symbol, name: nil)).to be_invalid
    end

    it "is invalid without an item_score" do
      expect(build(described_class_symbol, item_score: nil)).to be_invalid
    end

    it "is invalid without a level_requirement" do
      expect(build(described_class_symbol, level_requirement: nil)).to be_invalid
    end

    it "is invalid without a rarity" do
      expect(build(described_class_symbol, rarity: nil)).to be_invalid
    end

    it "is invalid without a damage_per_projectile" do
      expect(build(described_class_symbol, damage_per_projectile: nil)).to be_invalid
    end

    it "is invalid without a number_of_projectiles" do
      expect(build(described_class_symbol, number_of_projectiles: nil)).to be_invalid
    end

    it "is invalid without an accuracy" do
      expect(build(described_class_symbol, accuracy: nil)).to be_invalid
    end

    it "is invalid without a handling" do
      expect(build(described_class_symbol, handling: nil)).to be_invalid
    end

    it "is invalid without a reload_time" do
      expect(build(described_class_symbol, reload_time: nil)).to be_invalid
    end

    it "is invalid without a fire_rate" do
      expect(build(described_class_symbol, fire_rate: nil)).to be_invalid
    end

    it "is invalid without a magazine_size" do
      expect(build(described_class_symbol, magazine_size: nil)).to be_invalid
    end

    it "is invalid without an ammo_consumed_per_shot" do
      expect(build(described_class_symbol, ammo_consumed_per_shot: nil)).to be_invalid
    end

    it "is invalid without an element" do
      expect(build(described_class_symbol, element: nil)).to be_invalid
    end

    it "is invalid if element is not a subclass of Element::Base" do
      expect(build(described_class_symbol, element: String)).to be_invalid
    end

    it "is invalid if status_effect_element is not a subclass of Element::Base" do
      expect(build(described_class_symbol, status_effect_element: String)).to be_invalid
    end
  end

  it "returns element as a subclass of Element::Base" do
    expect(build(described_class_symbol).element).to be <= Element::Base
  end

  it "returns status_effect_element as a subclass of Element::Base" do
    expect(build(described_class_symbol, :with_status_effect).status_effect_element).to be <= Element::Base
  end

  it "responds to projectile_damage_per_shot" do
    expect(build(described_class_symbol)).to respond_to(:projectile_damage_per_shot)
  end

  it "returns expected projectile_damage_per_shot" do
    weapon = build(described_class_symbol, damage_per_projectile: 10, number_of_projectiles: 2)
    expect(weapon.projectile_damage_per_shot).to eq(20)
  end

  it "responds to shots_per_magazine" do
    expect(build(described_class_symbol)).to respond_to(:shots_per_magazine)
  end

  it "returns expected shots_per_magazine" do
    weapon = build(described_class_symbol, magazine_size: 12, ammo_consumed_per_shot: 3)
    expect(weapon.shots_per_magazine).to eq(4)
  end

  it "responds to projectile_damage_per_magazine" do
    expect(build(described_class_symbol)).to respond_to(:projectile_damage_per_magazine)
  end

  it "returns expected projectile_damage_per_magazine" do
    weapon = build(described_class_symbol,
      damage_per_projectile: 10,
      number_of_projectiles: 2,
      magazine_size: 12,
      ammo_consumed_per_shot: 2)
    expect(weapon.projectile_damage_per_magazine).to eq(120)
  end

  it "responds to seconds_to_empty_magazine" do
    expect(build(described_class_symbol)).to respond_to(:seconds_to_empty_magazine)
  end

  it "returns expected seconds_to_empty_magazine" do
    weapon = build(described_class_symbol,
      magazine_size: 36,
      ammo_consumed_per_shot: 2,
      fire_rate: 9)
    expect(weapon.seconds_to_empty_magazine).to eq(2)
  end

  it "responds to projectile_damage_per_second_excluding_reload_time" do
    expect(build(described_class_symbol)).to respond_to(:projectile_damage_per_second_excluding_reload_time)
  end

  it "returns expected projectile_damage_per_second_excluding_reload_time" do
    weapon = build(described_class_symbol,
      damage_per_projectile: 10,
      number_of_projectiles: 2,
      fire_rate: 4)
    expect(weapon.projectile_damage_per_second_excluding_reload_time).to eq(80)
  end

  it "responds to projectile_damage_per_second_including_reload_time" do
    expect(build(described_class_symbol)).to respond_to(:projectile_damage_per_second_including_reload_time)
  end

  it "returns expected projectile_damage_per_second_including_reload_time" do
    weapon = build(described_class_symbol,
      damage_per_projectile: 10,
      number_of_projectiles: 2,
      magazine_size: 48,
      ammo_consumed_per_shot: 2,
      fire_rate: 4,
      reload_time: 1.5)
    expect(weapon.projectile_damage_per_second_including_reload_time).to eq(64)
  end
end
