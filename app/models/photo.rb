class Photo < ApplicationRecord
  belongs_to :proyecto

  has_attached_file :image, styles: { medium: "600x600#", thumb: "480x480#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
