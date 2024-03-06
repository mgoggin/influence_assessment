# frozen_string_literal: true

class FormErrorComponent < ApplicationComponent
  def initialize(record: nil)
    @record = record
  end

  def template
    div(class: "flex text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400") do
      svg(class: "flex-shrink-0 inline w-4 h-4 me-3 mt-[2px]", aria_hidden: "true", xmlns: "http://www.w3.org/2000/svg", fill: "currentColor", viewbox: "0 0 20 20") do |s|
        s.path(d: "M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z")
      end

      div do
        span(class: "font-medium") { "Ensure that these requirements are met:" }

        ul(class: "mt-1.5 list-disc list-inside") do
          @record.errors.each do |error|
            li { error.full_message }
          end
        end
      end
    end
  end

  def render?
    @record&.errors&.any?
  end
end
