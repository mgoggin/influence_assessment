# frozen_string_literal: true

class Passwords::EditView < ApplicationView
  def initialize(player)
    @player = player
  end

  def template
    render AuthWrapperComponent.new do |wrapper|
      wrapper.title { "Change your password" }
      wrapper.explanation { "Verify your current password and then type a new password in the fields below." }

      render FormErrorComponent.new(record: @player)

      form_with(url: password_path, method: :patch, class: "space-y-4 md:space-y-6") do |form|
        div do
          form.label :password_challenge, "Current password", class: "block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          form.password_field :password_challenge, required: true, autofocus: true, autocomplete: "current-password", placeholder: "••••••••••••", class: "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        end

        div do
          form.label :password, "New password", class: "block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          form.password_field :password, required: true, autofocus: true, autocomplete: "new-password", placeholder: "••••••••••••", class: "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        end

        div do
          form.label :password_confirmation, "Confirm new password", class: "block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          form.password_field :password_confirmation, required: true, autocomplete: "new-password", placeholder: "••••••••••••", class: "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        end

        form.submit "Save changes", class: "w-full text-white bg-indigo-600 hover:bg-indigo-700 focus:ring-4 focus:outline-none focus:ring-indigo-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800"
      end
    end
  end
end
