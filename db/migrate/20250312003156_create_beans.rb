class CreateBeans < ActiveRecord::Migration[8.0]
  def change
    create_table :beans do |t|
      t.string :name
      t.string :roaster
      t.datetime :roast_date
      t.string :taste_profile
      t.boolean :decaf
      t.string :notes

      t.timestamps
    end
  end
end
