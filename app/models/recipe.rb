class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :name, presence: true, length: { minimum: 6, maximum: 30 }
  validates :summary, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 5, maximum: 200 }
end