# frozen_string_literal: true

class Gender
  include ActiveModel::Model

  VALUES = %i[
    male
    female
    prefer_not_to_say
  ]

  attr_reader :gender

  def initialize(attributes = {})
    @gender = attributes.with_indifferent_access.fetch(:gender)
  end

  def self.serialize(value); end
  def self.deserialize(value); end

  def self.all
    VALUES.map { new(gender: _1) }
  end

  def name
    gender.to_s
  end
end
