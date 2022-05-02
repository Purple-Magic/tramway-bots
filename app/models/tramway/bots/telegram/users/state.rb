# frozen_string_literal: true

class Tramway::Bots::Telegram::Users::State < Tramway::Core::ApplicationRecord
  belongs_to :user, class_name: 'BotTelegram::User'
  belongs_to :bot, class_name: 'Bot'
end
