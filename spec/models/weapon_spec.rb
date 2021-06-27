require "rails_helper"

RSpec.describe Weapon, type: :model do
  it "has a valid factory" do
    expect(build(described_class_symbol)).to be_valid
  end

  it "orders on created_at" do
    create(described_class_symbol, id: "ffffffff-ffff-ffff-ffff-ffffffffffff", created_at: 2.days.ago)
    create(described_class_symbol, id: "00000000-0000-0000-0000-000000000000")
    expect(described_class.last).to eq(described_class.order(:created_at).last)
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
      magazine_size: 48,
      ammo_consumed_per_shot: 2,
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
