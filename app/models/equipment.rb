class Equipment < ActiveRecord::Base
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validates :address, presence: true


  has_attached_file :picture,
    styles: { big: "750x500", medium: "300x300", thumb: "100x100" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
    where('"equipment"."name" LIKE ?', search)
  end

  def average_rating
    reviews.count > 1 ? reviews.average(:rate).round(2) : 0
  end
end
