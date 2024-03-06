# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Helpers::ButtonTag
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::HotwireLivereloadTags
  include Phlex::Rails::Layout

  def template
    html do
      head do
        title { "Influence Assessment" }
        meta(name: "viewport", content: "width=device-width,initial-scale=1")
        csrf_meta_tags
        csp_meta_tag
        action_cable_meta_tag
        stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload"
        stylesheet_link_tag "application", "data-turbo-track": "reload"
        javascript_importmap_tags
        hotwire_livereload_tags if Rails.env.development?
      end

      body(class: "mx-auto antialiased bg-white dark:bg-gray-800 text-gray-900 dark:text-white") do
        header(data: { controller: :toggle }, class: "antialiased")

        main(class: "flex-1 space-y-4") { plain yield }
      end
    end
  end
end
