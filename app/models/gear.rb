class Gear < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  belongs_to :maker
  belongs_to :club
  has_many :reviews

end
