# frozen_string_literal: true

class AuthWrapperComponent < ApplicationComponent
  include Phlex::Rails::Helpers::Flash
  include Phlex::Rails::Helpers::LinkTo

  def title(&block)
    h1(class: "text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white", &block)
  end

  def explanation(&block)
    p(class: "text-sm text-gray-800 dark:text-gray-300", &block)
  end

  def template(&block)
    section do
      div(class: "flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0") do
        link_to("Yo", root_path, class: "flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white")

        div(class: "w-full md:mt-0 sm:max-w-md xl:p-0") do
          flash.each do |key, message|
            render AlertComponent.new(type: key) { message }
          end
        end

        div(class: "w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700") do
          div(class: "p-6 space-y-4 md:space-y-6 sm:p-8", &block)
        end
      end
    end
  end
end
