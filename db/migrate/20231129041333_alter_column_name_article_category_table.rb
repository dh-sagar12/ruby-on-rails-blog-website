class AlterColumnNameArticleCategoryTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :article_categories, :article_id_id, :article_id
    rename_column :article_categories, :category_id_id, :category_id
  end
end
