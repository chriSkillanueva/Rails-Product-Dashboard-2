class Product < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  validates :name, :description, :pricing, presence: true
  validates :pricing, numericality: { greater_than: 0 }
end
