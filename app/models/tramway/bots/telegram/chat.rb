# frozen_string_literal: true

class Tramway::Bots::Telegram::Chat < ApplicationRecord
  self.table_name = 'tramway_bots_telegram_chats'

  has_many :messages, class_name: 'Tramway::Bots::Telegram::Message'
  belongs_to :bot, class_name: 'Bot'

  def private?
    chat_type == 'private'
  end
end
