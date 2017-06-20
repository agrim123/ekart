class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders , through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :description, :image_url, :company, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to:0.01}
  validates :title, uniqueness: true
  validates :tags, presence: true
  validates :category, presence: true
  mount_uploader :picture, PictureUploader
  validates :image_url, allow_blank: true, format: {
    with: %r{\.gif|jpg|jpeg|png}i,
    message: 'must be a GIF, JPG or PNG image'
  }
  validates :rating, :inclusion => 0..5

  def self.latest
    Product.order(:updated_at).latest
  end
  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base,'Line Items present')
      return false
    end
  end

  def self.search(search)
    where("title LIKE ? OR description LIKE ? OR tags LIKE ?","%#{search}%", "%#{search}%","%#{search}%")
  end

  def self.category_search(category_search)
    where("category LIKE ?", "%#{search}%")
  end
end
