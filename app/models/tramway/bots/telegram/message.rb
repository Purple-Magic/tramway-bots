# frozen_string_literal: true

class Tramway::Bots::Telegram::Message < ApplicationRecord
  self.table_name = 'tramway_bots_telegram_messages'

  belongs_to :user, class_name: 'Tramway::Bots::Telegram::User', optional: true
  belongs_to :bot, class_name: 'Tramway::Bots::Bot', optional: true
  belongs_to :chat, class_name: 'Tramway::Bots::Telegram::Chat', optional: true

  enumerize :message_type, in: %i[regular callback], default: :regular

  validates :telegram_message_id, uniqueness: { scope: [ :bot_id, :chat_id ] }, allow_nil: true

  search_by :text, user: %i[username first_name]
end
