# frozen_string_literal: true

class AgeGroupType < ActiveModel::Type::String
  def serialize(value)
    value.name if value.present?
  end

  def deserialize(value)
    range = if (match = value.match(/(\d+)\+/))
      match[1].to_i..
    elsif (match = value.match(/Under (\d+)/))
      ..match[1].to_i
    elsif (match = value.match(/(\d+)\-(\d+)/))
      match[1].to_i..match[2].to_i
    end

    AgeGroup.new(range:)
  end

  def type
    :age_group
  end

  def cast(value)
    return deserialize(value) if value.is_a?(String)

    value
  end
end
