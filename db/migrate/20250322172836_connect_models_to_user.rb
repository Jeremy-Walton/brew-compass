class ConnectModelsToUser < ActiveRecord::Migration[8.0]
  def up
    add_reference :brews, :user, foreign_key: true
    add_reference :beans, :user, foreign_key: true
    add_reference :brewing_methods, :user, foreign_key: true

    user = User.find_or_create_by!(email: "jeremy.patrick.walton@gmail.com")

    Brew.update_all(user_id: user.id)
    Bean.update_all(user_id: user.id)
    BrewingMethod.update_all(user_id: user.id)

    change_column_null :brews, :user_id, false
    change_column_null :beans, :user_id, false
    change_column_null :brewing_methods, :user_id, false
  end

  def down
    remove_reference :brews, :user, foreign_key: true
    remove_reference :beans, :user, foreign_key: true
    remove_reference :brewing_methods, :user, foreign_key: true
  end
end
