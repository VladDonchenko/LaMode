class Product < ApplicationRecord
  belongs_to :category
  has_many :categories
  validates :title, :price, :description, presence: true

  def self.search(search)
    where('title LIKE ?', "%#{search}%")
  end

     def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
