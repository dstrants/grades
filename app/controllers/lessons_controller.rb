class LessonsController < ApplicationController
  def index; end

  def new
    @lessons = Lesson.all
  end

  def submit_grades
    Lesson.all.each do |les|
      @grade = params[les.name]
      les.update_attribute(:grade, @grade)
    end
    redirect_to action: 'index'
  end
end
