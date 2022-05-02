# frozen_string_literal: true

FactoryBot.define do
  factory :tramway_bots_telegram_message, class: 'Tramway::Bots::Telegram::Message' do
    user { create :bot_telegram_user, telegram_id: generate(:string) }
    text { generate(:string) }
  end
end
