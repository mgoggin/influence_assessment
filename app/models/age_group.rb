# frozen_string_literal: true

class AgeGroup
  include ActiveModel::Model

  VALUES = [
    18..25,
    26..38,
    39..50,
    50..64,
    65..
  ]

  attr_reader :range

  delegate :include?, to: :range

  def initialize(attributes = {})
    @range = attributes.with_indifferent_access.fetch(:range)
  end

  def self.all
    VALUES.map { new(range: _1) }
  end

  def self.for(age)
    all.find { _1.include?(age) }
  end

  def name
    return "Under #{range.last}" if range.begin.nil?
    return "#{range.first}+" if range.end.nil?

    [range.first, range.last].join('-')
  end
end
