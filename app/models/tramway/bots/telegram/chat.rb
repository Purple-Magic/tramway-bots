# frozen_string_literal: true

class Tramway::Bots::Telegram::Chat < ApplicationRecord
  has_many :messages, class_name: 'Tramway::Bots::Telegram::Message'
  belongs_to :bot, class_name: 'Bot'

  def private?
    chat_type == 'private'
  end
end
