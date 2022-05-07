# frozen_string_literal: true

# Enables the extension needed within Postgres for UUID support.
class EnablePostgresUuids < ActiveRecord::Migration[7.0]
  def change
    enable_extension('pgcrypto') unless extension_enabled?('pgcrypto')
  end
end
