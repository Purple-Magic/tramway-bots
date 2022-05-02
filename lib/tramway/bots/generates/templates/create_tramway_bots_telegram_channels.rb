# frozen_string_literal: true

class CreateTramwayBotsTelegramChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_bot_engine_telegram_channels do |t|
      t.integer :bot_id
      t.text :title
      t.text :state
      t.text :telegram_channel_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
