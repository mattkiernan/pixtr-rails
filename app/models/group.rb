class Group < ActiveRecord::Base
  has_many :group_memberships
  has_many :members, through: :group_memberships
  has_many :images, through: :groupings
  has_many :groups

  validates :name, presence: true
  validates :description, presence: true
end
