# frozen_string_literal: true

class AlertComponent < ApplicationComponent
  KNOWN_FLASH_KEYS = %i[alert notice]

  def initialize(type: :notice)
    @type = type.to_sym
  end

  def title(&block)
    span(class: "font-medium", &block)
  end

  def template(&block)
    div(
      role: "alert",
      **classes(
        "w-full p-4 mb-4 text-sm rounded-lg",
        -> { @type == :alert } => "text-red-800 bg-red-50 dark:bg-gray-800 dark:text-red-400",
        -> { @type == :notice } => "text-blue-800 bg-blue-50 dark:bg-gray-800 dark:text-blue-400",
        -> { !@type.in?(KNOWN_FLASH_KEYS) } => "text-gray-800 bg-gray-50 dark:bg-gray-800 dark:text-gray-300"
      ),
      &block
    )
  end
end
