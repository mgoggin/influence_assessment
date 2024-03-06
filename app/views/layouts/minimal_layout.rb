# frozen_string_literal: true

class MinimalLayout < ApplicationView
  include Phlex::Rails::Layout
  include Phlex::Rails::Helpers::HotwireLivereloadTags

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

      body(class: "dark mx-auto bg-gray-50 dark:bg-gray-900") { plain yield }
    end
  end
end
