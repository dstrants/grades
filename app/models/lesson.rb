class Lesson < ApplicationRecord
  before_save :default_values
  def default_values
    self.grade ||= 0
  end

  def thesis?
    Lesson.where(type: 5, grade: [5..10]).count == 1
  end

  def basics?
    Lesson.where(type: 2, grade: [5..10]).count > 3
  end

  def generals?
    Lesson.where(type: 2, grade: [5..10]).count > 1
  end

  def specials?
    Lesson.where(type: 3, grade: [5..10]).count > 1
  end

  def no_thesis
    Lesson.where(type: [2..3], grade: [5..10]).count > 5 unless thesis?
  end
end
