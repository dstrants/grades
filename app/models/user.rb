class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_many :lessons

  before_create do
    create_user_lessons
    select_obligatory
  end

  def create_user_lessons
    Lesson.where(ltype: 1).each do |les|
      @lesson = lessons.new
      @lesson = les
      @lesson.save!
    end
  end

  def select_obligatory
    lessons.where(ltype: 1).each do |les|
      les.update_attribute(:selected, true)
    end
  end
end
