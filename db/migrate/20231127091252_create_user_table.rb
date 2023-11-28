class CreateUserTable < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.text :password, null: false
      t.string :full_name, null: false
      t.boolean :is_active, null: false, default: false
      t.boolean :is_admin, null: false, default: false
      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
