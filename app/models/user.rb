class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_many :lessons, dependent: :destroy
  after_create :create_user_lessons

  def create_user_lessons
    Subject.all.each do |les|
      lessons.create!(les.attributes)
    end
  end

  def s_avg
    lessons.where(selected: true, grade: [5..10]).average(:grade)
  end

  def basics?
    lessons.where(ltype: 2, selected: true).count > 3
  end

  def generals?
    lessons.where(ltype: 3, selected: true).count > 2
  end

  def specials?
    lessons.where(ltype: 4, selected: true).count > 2
  end

  def thesis?
    !lessons.where(ltype: 5, selected: true).nil?
  end

  def ects?
    lessons.where(selected: true).sum(:ects) > 239
  end

  def ects
    lessons.where(selected: true, grade: [5..10]).sum(:ects)
  end

  def selections?
    lessons.where(ltype: [2..5], selected: true).count > 10
  end

  def selections_ects?
    lessons.where(ltype: [2..5], selected: true).sum(:ects) > 51
  end

  def all_passed?
    lessons.where(selected: true, grade: [5..10]).count > 41
  end

  def eligible?
    basics? && generals? && specials? && ects? && selections? && selections_ects?
  end

  def graduated?
    eligible? && all_passed?
  end
end
