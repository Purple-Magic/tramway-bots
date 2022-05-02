# frozen_string_literal: true

class Tramway::Bots::Telegram::Chat < Tramway::Core::ApplicationRecord
  has_many :messages, class_name: 'BotTelegram::Message'
  belongs_to :bot, class_name: 'Bot'
  self.table_name = :bot_telegram_chats

  def private?
    chat_type == 'private'
  end
end
