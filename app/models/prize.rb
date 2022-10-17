class Prize < ApplicationRecord
  scope :chosen, -> { where(chosen: true) }

  def self.recreate!(values)
    destroy_all

    values.each do |value|
      order = 0
      while exists?(order:)
        order = (0..values.length).to_a.sample
      end

      create!(value:, order:)
    end

    all.order(:order).pluck(:order, :value)
  end

  def self.chosen?
    chosen.any?
  end

  def self.revealed?
    where(revealed: false).none?
  end

  def self.chosen_prize
    chosen.first
  end

  def css_classes
    [].tap do |classes|
      classes << "chosen" if chosen?
      classes << "rejected" if rejected?
      classes << "revealed" if revealed?
    end
  end

  def stateful_value
    if revealed?
      value
    else
      "???"
    end
  end
end
