# frozen_string_literal: true

class CreateTramwayBotsBots < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_bot_engine_bots do |t|
      t.text :name
      t.text :state
      t.text :team
      t.text :token
      t.jsonb :options
      t.text :slug
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
