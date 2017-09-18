class Category < ApplicationRecord
  belongs_to :project

  has_and_belongs_to_many :articles, dependent: :destroy

  def children(parent_id)
    self.class.where(parent_id: parent_id)
  end

  def delete_with_children
    def _delete(id)
      _category = self.class.find(id)
      _children = self.class.where(parent_id: id)
      _category.destroy
      _category.articles.each do |article|
        article.destroy
      end
      _category.articles.destroy
      _children.each do |_child|
        _delete(_child.id)
      end
    end

    _delete(self.id)
  end
end
