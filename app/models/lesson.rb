class Lesson < ApplicationRecord
  validates_uniqueness_of :code
  validates :grade, inclusion: [in: [0..10]]
  before_save :default_values
  def default_values
    self.grade ||= 0
  end
end
