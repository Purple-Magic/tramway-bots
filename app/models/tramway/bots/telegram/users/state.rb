# frozen_string_literal: true

class Tramway::Bots::Telegram::Users::State < ApplicationRecord
  belongs_to :user, class_name: 'Tramway::Bots::Telegram::User'
  belongs_to :bot, class_name: 'Tramway::Bots::Bot'
end
