# frozen_string_literal: true

require 'telegram/bot'
require 'tramway/bots/telegram/messages_manager'

module Tramway::Bots::Telegram::Custom::Notify::Text
  class << self
    include ::Tramway::Bots::Telegram::MessagesManager

    def send_to_user(bot_id, username, message)
      bot_record = Tramway::Bots::Bot.find bot_id
      bot = ::Telegram::Bot::Client.new bot_record.token
      chat = Tramway::Bots::Telegram::Chat.where(bot_id: bot_id).find_by "options ->> 'username' = '#{username}'"
      message_to_user bot.api, message, chat.telegram_chat_id if chat.present?
    end

    def send_to_chat(bot_id, chat_id, message, **options)
      bot_record = Tramway::Bots::Bot.find bot_id
      bot = ::Telegram::Bot::Client.new bot_record.token
      message_to_chat bot.api, chat_id, message, **options
    end

    def send_to_channel(bot_id, channel_id, message)
      bot_record = Tramway::Bots::Bot.find bot_id
      bot = ::Telegram::Bot::Client.new bot_record.token
      message_to_user bot.api, message, channel_id
    end
  end
end
