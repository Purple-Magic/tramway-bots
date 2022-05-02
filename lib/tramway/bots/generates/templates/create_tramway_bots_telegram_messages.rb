# frozen_string_literal: true

class CreateTramwayBotsTelegramMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_bots_telegram_messages do |t|
      t.integer :chat_id
      t.integer :user_id
      t.text :text
      t.jsonb :options
      t.text :state
      t.integer :bot_id
      t.text :message_type, default: "regular"
      t.datetime :deleted_at
      t.integer :telegram_message_id

      t.timestamps
    end
  end
end
