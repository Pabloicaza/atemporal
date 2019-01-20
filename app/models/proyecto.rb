class Proyecto < ApplicationRecord
  has_many :photos, dependent: :destroy

  validates :nombre_proyecto, presence: true
  validates :tipo_proyecto, presence: true
  validates :ubicacion, presence: true

  def show_first_photo(size)
    if (size == :thumb) || (size == :medium)
      self.photos[0].image.url(size)
    else
      self.photos[0].image
    end
  end

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  def next
    Proyecto.next(self.id).first
  end

  def previous
    Proyecto.previous(self.id).first
  end

end
