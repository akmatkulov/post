class Article < ApplicationRecord
  mount_uploader :picture, ImageUploader
  belongs_to :user
end
