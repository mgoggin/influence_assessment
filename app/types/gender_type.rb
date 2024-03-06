# frozen_string_literal: true

class GenderType < ActiveModel::Type::String
  def serialize(value)
    value.gender.presence
  end

  def deserialize(value)
    Gender.new(gender: value) if value.present?
  end

  def type
    :gender
  end

  def cast(value)
    return deserialize(value.to_s) if value.is_a?(String) || value.is_a?(Symbol)

    value
  end
end
