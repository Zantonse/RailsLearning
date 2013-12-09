class CreateArticlesCategories < ActiveRecord::Migration
  def change
    create_table :articles_categories, :id => false do |t|
      t.references :articles
      t.references :category
    end
  end
  def self.down
    drop_table :articles_categories
  end
end
