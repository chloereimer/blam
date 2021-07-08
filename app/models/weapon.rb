class Weapon < ApplicationRecord
  include ActiveModel::Validations

  self.implicit_order_column = "created_at"

  attribute :ammo_consumed_per_shot, default: 1
  attribute :element, default: Element::Physical

  validates :name, presence: true
  validates :item_score, presence: true
  validates :level_requirement, presence: true
  validates :rarity, presence: true, inclusion: {in: ["Common", "Uncommon", "Rare", "Epic", "Legendary"]}
  validates :damage_per_projectile, presence: true
  validates :number_of_projectiles, presence: true
  validates :accuracy, presence: true
  validates :handling, presence: true
  validates :reload_time, presence: true
  validates :fire_rate, presence: true
  validates :magazine_size, presence: true
  validates :ammo_consumed_per_shot, presence: true
  validates :element, presence: true, is_element: true
  validates :status_effect_element, is_element: true, allow_blank: true

  def element
    self[:element]&.constantize
  end

  def status_effect_element
    self[:status_effect_element]&.constantize
  end

  def shots_per_magazine
    magazine_size / ammo_consumed_per_shot
  end

  def seconds_to_empty_magazine
    shots_per_magazine / fire_rate
  end

  def projectile_damage_per_shot
    damage_per_projectile * number_of_projectiles
  end

  def projectile_damage_per_second_excluding_reload_time
    projectile_damage_per_shot * fire_rate
  end

  def projectile_damage_per_magazine
    projectile_damage_per_shot * shots_per_magazine
  end

  def projectile_damage_per_second_including_reload_time
    projectile_damage_per_magazine / (seconds_to_empty_magazine + reload_time)
  end

  # status effects have a duration, and status effects of the same element do
  # not stack; therefore, there's a hard limit on the number of status effects
  # that a magazine can apply (which we can use to calculate maximum status
  # effect damage per magazine).
  def maximum_status_effects_per_magazine
    return 0 unless status_effect_chance > 0

    milliseconds_between_shots = 1 / fire_rate * 1000
    status_effect_duration_in_milliseconds = status_effect_element.status_effect_duration_in_seconds * 1000
    milliseconds_to_empty_magazine = seconds_to_empty_magazine * 1000

    maximum_status_effect_durations_per_magazine = (milliseconds_to_empty_magazine / status_effect_duration_in_milliseconds).ceil

    # the first shot will apply a status effect
    number_of_status_effects_per_magazine = 1

    total_time = status_effect_duration_in_milliseconds

    maximum_status_effect_durations_per_magazine.times do |status_effects_elapsed|
      # a status effect has just elapsed; how many ms do i need to wait for the
      # next shot (assuming that that shot will apply a status effect)?
      unless milliseconds_between_shots > total_time
        total_time += total_time % milliseconds_between_shots
      end

      # by the time i've waited that amount, will the magazine be expended?
      break if total_time > milliseconds_to_empty_magazine

      number_of_status_effects_per_magazine += 1

      # start the next loop at the end of this status effect duration
      total_time += status_effect_duration_in_milliseconds
    end

    number_of_status_effects_per_magazine
  end

  def maximum_status_effect_damage_per_magazine
    maximum_status_effects_per_magazine * status_effect_damage
  end
end
