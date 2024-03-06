# frozen_string_literal: true

class Identity::Emails::EditView < ApplicationView
  def initialize(player)
    @player = player
  end

  def template
    render AuthWrapperComponent.new do |wrapper|
      if @player.verified?
        wrapper.title { "Change your email" }
        wrapper.explanation { "Enter a new email address and verify your current password in the fields below." }

        render FormErrorComponent.new(record: @player)

        form_with(url: identity_email_path, method: :patch, class: "space-y-4 md:space-y-6") do |form|
          div do
            form.label :email, "New email", class: "block mb-2 text-sm font-medium text-gray-900 dark:text-white"
            form.email_field :email, required: true, autofocus: true, placeholder: "you@email.com", class: "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          end

          div do
            form.label :password_challenge, "Current password", class: "block mb-2 text-sm font-medium text-gray-900 dark:text-white"
            form.password_field :password_challenge, required: true, autofocus: true, autocomplete: "current-password", placeholder: "••••••••••••", class: "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          end

          form.submit "Save changes", class: "w-full text-white bg-indigo-600 hover:bg-indigo-700 focus:ring-4 focus:outline-none focus:ring-indigo-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800"
        end
      else
        wrapper.title { "Verify your email" }
        wrapper.explanation { "You cannot change your email until your current one is verified. Check your current email for verification instructions." }

        link_to "Re-send verification email", identity_email_verification_path, class: "block w-full text-white bg-indigo-600 hover:bg-indigo-700 focus:ring-4 focus:outline-none focus:ring-indigo-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800"
      end
    end
  end
end
