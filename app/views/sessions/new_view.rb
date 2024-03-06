# frozen_string_literal: true

class Sessions::NewView < ApplicationView
  def template
    render AuthWrapperComponent.new do |wrapper|
      wrapper.title { "Sign in to your account" }

      form_with(url: sign_in_path, class: "space-y-4 md:space-y-6") do |form|
        div do
          form.label :email, class: "block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          form.email_field :email, required: true, autofocus: true, autocomplete: "username", placeholder: "you@email.com", class: "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        end

        div do
          form.label :password, class: "block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          form.password_field :password, required: true, autocomplete: "current-password", placeholder: "••••••••••••", class: "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        end

        div do
          link_to("Forgot your password?", new_identity_password_reset_path, class: "mt-5 text-sm font-medium text-indigo-600 hover:underline dark:text-indigo-500")
        end

        form.submit "Sign in", class: "w-full text-white bg-indigo-600 hover:bg-indigo-700 focus:ring-4 focus:outline-none focus:ring-indigo-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800"
      end
    end
  end
end
