# frozen_string_literal: true

FactoryBot.define do
  factory :tramway_bots_telegram_user, class: 'BotTelegram::User' do
    telegram_id { '123' }
    username
  end
end
