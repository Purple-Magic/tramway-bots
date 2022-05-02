# frozen_string_literal: true

class CreateTramwayBotsTelegramChats < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_bots_telegram_chats do |t|
      t.text :title
      t.text :chat_type
      t.jsonb :options
      t.text :state
      t.text :telegram_chat_id
      t.integer :bot_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
