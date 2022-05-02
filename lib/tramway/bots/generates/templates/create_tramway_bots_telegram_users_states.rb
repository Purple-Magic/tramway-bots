# frozen_string_literal: true

class CreateTramwayBotsTelegramUsersStates < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_bot_engine_telegram_users_states do |t|
      t.integer "user_id"
      t.integer "bot_id"
      t.text "current_state"
      t.text "state"
      t.datetime "deleted_at"

      t.timestamps
    end
  end
end
