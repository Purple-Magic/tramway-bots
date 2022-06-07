# frozen_string_literal: true

FactoryBot.define do
  factory :tramway_bots_bot, class: 'Tramway::Bots::Bot' do
    name { generate :string }
    team { Bot.team.values.sample }
    token { generate :string }
    slug { generate :string }

    factory :benchkiller_bot, traits: [:benchkiller]

    options do
      {
        custom: true,
        scenario: :benchkiller_bot
      }
    end
  end
end
