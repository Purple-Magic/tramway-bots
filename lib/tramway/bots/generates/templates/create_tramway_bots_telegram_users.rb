# frozen_string_literal: true

class CreateTramwayBotsTelegramUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_bots_telegram_users do |t|
      t.text "first_name"
      t.text "last_name"
      t.text "username"
      t.jsonb "options"
      t.text "state"
      t.text "telegram_id"
      t.datetime "deleted_at"

      t.timestamps
    end
  end
end
