class Product < ApplicationRecord
	belongs_to :category
	validates :title, :price, :description, presence: true

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end
end
