# frozen_string_literal: true

FactoryBot.define do
  factory :tramway_bots_telegram_chat, class: 'Tramway::Bots::Telegram::Chat' do
    telegram_chat_id { generate :string }

    factory :tramway_bots_telegram_private_chat, traits: [:private]

    trait :private do
      chat_type { :private }
    end
  end
end
