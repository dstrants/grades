class Lesson < ApplicationRecord
  before_save :default_values
  def default_values
    self.grade ||= 0
    if self.ltype == 1
      self.selected = true
    else
      self.selected ||= false
    end
  end

  def self.thesis?
    Lesson.where(type: 5, grade: [5..10], selected: true).count == 1
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

  def self.no_thesis?
    Lesson.where(type: [2..3], grade: [5..10]).count > 5 unless thesis?
  end
end
