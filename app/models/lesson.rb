class Lesson < ApplicationRecord
  before_save :default_values
  belongs_to :user, optional: true
  def default_values
    self.grade ||= 0
    if ltype == 1
      self.selected = true
    else
      self.selected ||= false
    end
  end

  def passed?
    if grade > 4
      true
    else
      false
    end
  end
end
