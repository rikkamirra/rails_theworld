class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user
      t.references :project
      t.timestamps
    end

    create_table :articles_categories do |t|
      t.references :article
      t.references :category
    end
  end
end
