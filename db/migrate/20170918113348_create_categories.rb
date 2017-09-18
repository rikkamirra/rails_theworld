class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :parent_id, default: 0
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
