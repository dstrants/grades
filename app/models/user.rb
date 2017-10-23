class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_many :lessons

  before_create do
    create_user_lessons
  end

  def create_user_lessons
    Lesson.all.each do |les|
      @lesson = lessons.new
      @lesson = les
      @lesson.save!
    end
  end
end
