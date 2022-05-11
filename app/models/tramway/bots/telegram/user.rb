# frozen_string_literal: true

class Tramway::Bots::Telegram::User < ApplicationRecord
  self.table_name = 'tramway_bots_telegram_users'

  has_many :messages, class_name: 'Tramway::Bots::Telegram::Message'
  has_many :bots, class_name: 'Tramway::Bots::Bot', through: :steps
  has_many :states, class_name: 'Tramway::Bots::Telegram::Users::State'

  validates :telegram_id, uniqueness: true
  validates :username, uniqueness: true, allow_blank: true, allow_nil: true

  search_by :first_name, :username, :last_name

  scope :partner_scope, ->(_user_id) { all }
  %i[rsm night purple_magic].each do |team|
    scope "#{team}_scope".to_sym, lambda { |_user_id|
      step_ids = Bot.where(team: team).map(&:steps).flatten.map(&:id)
      records = BotTelegram::Scenario::ProgressRecord.where(bot_telegram_scenario_step_id: step_ids)
      BotTelegram::User.where id: records.map(&:bot_telegram_user_id)
    }
  end

  def current_state(bot)
    states.where(bot_id: bot.id).last&.current_state
  end

  # rubocop:disable Naming/AccessorMethodName
  def set_finished_state_for(bot:)
    states.create! bot_id: bot.id, current_state: :finished
  end
  # rubocop:enable Naming/AccessorMethodName

  def finished_state_for?(bot:)
    states.empty? || states.where(bot_id: bot.id).last&.current_state == 'finished'
  end
end
