class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes
  validates :name, presence: true, length: { minimum: 6, maximum: 30 }
  validates :summary, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 5, maximum: 200 }
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(created_at: :desc) }

  def thumbs_up_total
    self.likes.where(likes: true).size
  end

  def thumbs_down_total
    self.likes.where(likes: false).size
  end

  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, 'should be less than 5MB')
      end
    end

end