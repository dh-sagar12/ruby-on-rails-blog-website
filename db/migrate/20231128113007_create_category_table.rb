class CreateCategoryTable < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.references :creator, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end

    add_index :categories, :title, unique: true
  end
end
