class CreateBrewingMethods < ActiveRecord::Migration[8.0]
  def change
    create_table :brewing_methods do |t|
      t.string :name, null: false
      t.string :prep_type, null: false, default: 'pourover'

      t.timestamps
    end
  end
end
