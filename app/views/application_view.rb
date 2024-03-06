# frozen_string_literal: true

class ApplicationView < ApplicationComponent
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::ImageTag
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::Routes
  # The ApplicationView is an abstract class for all your views.

  # By default, it inherits from `ApplicationComponent`, but you
  # can change that to `Phlex::HTML` if you want to keep views and
  # components independent.
end
