class CreateBrews < ActiveRecord::Migration[8.0]
  def change
    create_table :brews do |t|
      t.belongs_to :brewing_method, null: false, foreign_key: true
      t.belongs_to :bean, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
