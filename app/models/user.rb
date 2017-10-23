class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_many :lessons, dependent: :destroy
  after_create :create_user_lessons

  def create_user_lessons
    Subject.all.each do |les|
      self.lessons.create!(les.attributes)
    end
  end
end
