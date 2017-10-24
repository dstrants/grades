class LessonsController < ApplicationController
  before_action :authenticate_user!
  def index
    @list = current_user.lessons.where(selected: true).group_by(&:semester)
  end

  def grades; end

  def semesters
    @semesters = current_user.lessons.where(selected: true).group_by(&:semester)
  end

  def show_semester
    @semesters = current_user.lessons.where(selected: true).group_by(&:semester)
    @semester = @semesters[params[:id].to_i]
  end

  def stats; end

  def add
    @basics = current_user.lessons.where(ltype: 2)
    @generals = current_user.lessons.where(ltype: 3)
    @specials = current_user.lessons.where(ltype: 4)
    @thesis = current_user.lessons.where(ltype: 5)
  end

  def submit_grades
    current_user.lessons.all.each do |les|
      @grade = params[les.name]
      les.update_attribute(:grade, @grade)
    end
    redirect_to action: 'index'
  end

  def select
    @les = current_user.lessons.find(params[:lesson])
    @les.update_attribute(:selected, true) unless @les.selected
    redirect_to action: 'add'
  end

  def delete
    @basics = current_user.lessons.where(ltype: 2, selected: true)
    @generals = current_user.lessons.where(ltype: 3, selected: true)
    @specials = current_user.lessons.where(ltype: 4, selected: true)
    @thesis = current_user.lessons.where(ltype: 5, selected: true)
  end

  def remove
    @les = current_user.lessons.find(params[:lesson])
    @les.update_attribute(:selected, false) if @les.selected
    redirect_to action: 'new'
  end
end
