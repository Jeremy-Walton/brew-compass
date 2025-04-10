# This migration comes from shipped (originally 20250329000613)
class CreateShippedReleases < ActiveRecord::Migration[8.0]
  def change
    create_table :shipped_releases do |t|
      t.string :release_identifier, null: false
      t.datetime :released_at, null: false
      t.text :notes

      t.timestamps
    end
  end
end
