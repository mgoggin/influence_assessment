# frozen_string_literal: true

class Home::IndexView < ApplicationView
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::Flash
  include Phlex::Rails::Helpers::LinkTo

  def initialize(offers:)
    @offers = offers
  end

  def template
    section do
      div(class: "flex flex-col items-center justify-center px-6 py-8 mx-auto") do
        div(class: "w-full md:mt-0 sm:max-w-md md:max-w-screen-xl xl:p-0") do
          flash.each do |key, message|
            render AlertComponent.new(type: key) { message }
          end
        end

        h1(class: 'mb-6 text-2xl font-semibold text-gray-900 dark:text-white') { 'Claimed Offers' }

        if Current.player.offers.empty?
          div(class: "pb-10") do
            h3(class: 'lead italic text-gray-600 dark:text-gray-400') { plain "You have not claimed any offers yet! Check below!" }
          end
        else
          Current.player.offers.each do |offer|
            div(class: "mb-5 w-full bg-white rounded-lg shadow dark:border dark:border-teal-600 md:mt-0 sm:max-w-md md:max-w-screen-xl dark:bg-gray-800 dark:border-gray-700") do
              div(class: "p-6 space-y-4 md:space-y-6 sm:p-8") do
                h4(class: "text-xl text-teal-400") { plain offer.description }
              end
            end
          end
        end

        h1(class: 'mb-6 text-2xl font-semibold text-gray-900 dark:text-white') { 'Available Offers' }

        if @offers.blank?
          div(class: "pb-10") do
            h3(class: 'lead italic text-gray-600 dark:text-gray-400') { plain "There are no more available offers. Check back soon!" }
          end
        else
          @offers.each do |offer|
            div(class: "mb-5 w-full bg-white rounded-lg shadow dark:border dark:border-indigo-600 md:mt-0 sm:max-w-md md:max-w-screen-xl dark:bg-gray-800 dark:border-gray-700") do
              div(class: "p-6 space-y-4 md:space-y-6 sm:p-8") do
                h4(class: "text-xl text-indigo-400") { plain offer.description }

                button_to(claim_offer_path(offer), method: :post, class: "block w-fit text-white bg-indigo-600 hover:bg-indigo-700 focus:ring-4 focus:outline-none focus:ring-indigo-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800") { plain 'Claim' }
              end
            end
          end
        end

        div(class: "w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md md:max-w-screen-xl xl:p-0 dark:bg-gray-800 dark:border-gray-700") do
          div(class: "p-6 space-y-4 md:space-y-6 sm:p-8") { render template: 'home/index' }
        end
      end
    end
  end
end
