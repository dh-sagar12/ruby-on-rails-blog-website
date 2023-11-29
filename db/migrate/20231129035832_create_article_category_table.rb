class CreateArticleCategoryTable < ActiveRecord::Migration[7.1]
  def change
    create_table :article_categories do |t|
      t.references :article_id, foreign_key: { to_table: :articles }, null: false
      t.references :category_id, foreign_key: { to_table: :categories }, null: false
      t.timestamps
    end
  end
end
