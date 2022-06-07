# frozen_string_literal: true

module Tramway::Bots::Telegram::Custom::Notify::File
  class << self
    include Tramway::Bots::Telegram::MessagesManager

    def send_to_user(bot_id, username, file)
      bot_record = Bot.find bot_id
      bot = ::Telegram::Bot::Client.new bot_record.token
      chat = ::Tramway::Bots::Telegram::Chat.where(bot_id: bot_id).find_by "options ->> 'username' = '#{username}'"
      bot_message = ::Tramway::Bots::Telegram::Leopold::Message.new file
      send_file bot.api, chat.telegram_chat_id, bot_message
    end

    def send_to_chat(bot_id, chat_id, file)
      bot_record = Bot.find bot_id
      bot = ::Telegram::Bot::Client.new bot_record.token
      bot_message = ::Tramway::Bots::Telegram::Leopold::Message.new file
      send_file bot.api, chat_id, bot_message.file
    end
  end
end
