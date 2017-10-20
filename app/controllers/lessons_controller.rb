class LessonsController < ApplicationController
  def index; end

  def new
    @lessons = Lesson.all
  end

  def semesters; end

  def stats; end


  def add
    @basics = Lesson.where(ltype: 2)
    @generals = Lesson.where(ltype: 3)
    @specials = Lesson.where(ltype: 4)
    @thesis = Lesson.where(ltype: 5)
  end

  def submit_grades
    Lesson.all.each do |les|
      @grade = params[les.name]
      les.update_attribute(:grade, @grade)
    end
    redirect_to action: 'index'
  end

  def select
    @les = Lesson.find(params[:lesson])
    @les.update_attribute(:selected, true) unless @les.selected
    redirect_to action: 'add'
  end

  def delete
    @basics = Lesson.where(ltype: 2, selected: true)
    @generals = Lesson.where(ltype: 3, selected: true)
    @specials = Lesson.where(ltype: 4, selected: true)
    @thesis = Lesson.where(ltype: 5, selected: true)
  end

  def remove
    @les = Lesson.find(params[:lesson])
    @les.update_attribute(:selected, false) if @les.selected
    redirect_to action: 'new'
  end
end
