class Project < ApplicationRecord
  validates :title, presence: true
  
  has_many :categories, dependent: :destroy

  belongs_to :user
end
