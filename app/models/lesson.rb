class Lesson < ApplicationRecord
  before_save :default_values
  def default_values
    self.grade ||= 0
  end
end
