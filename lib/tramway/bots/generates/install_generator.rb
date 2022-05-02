# frozen_string_literal: true

require 'rails/generators'
require 'tramway/core/generators/install_generator'

module Tramway::Bots::Generators
  class InstallGenerator < ::Tramway::Core::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migrations = %i[
        create_tramway_bots_bots
        create_tramway_bots_telegram_channels
        create_tramway_bots_telegram_chats
        create_tramway_bots_telegram_messages
        create_tramway_bots_telegram_users
        create_tramway_bots_telegram_users_states
      ]

      migrations.each do |migration|
        migration_template "#{migration}.rb", "db/migrate/#{migration}.rb"
      end
    end

    def copy_factories
      factories = [
        'tramway/bots/telegram/messages',
        'tramway/bots/telegram/chats',
        'tramway/bots/telegram/users',
        'tramway/bots/bots'
      ]

      factories.each do |factory|
        # TODO write generator for minitest
        create_file "spec/factories/#{factory}.rb", File.read("#{File.dirname(__dir__)}/../../../spec/factories/#{factory}.rb")
      end
    end
  end
end
