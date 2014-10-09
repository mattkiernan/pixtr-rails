class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  has_many :likes
  has_many :groupings
  has_many :groups, through: :groupings
  has_many :taggings
  has_many :tags, through: :taggings
  validates :name, presence: true
  validates :url, presence: true
  
  def tag_words
    tags.pluck(:name).join(", ")
  end

end
