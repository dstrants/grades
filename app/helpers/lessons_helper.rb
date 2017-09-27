module LessonsHelper
  def avg_calc
    @lessons = Lesson.where(grade: [5..10], selected: true)
    @sum = 0
    @lessons.each do |les|
      @sum += les.ects * les.grade.to_f
    end
    @avg = @sum / @lessons.sum(:ects) unless @lessons.sum(:ects).zero?
  end

  # Obligatory Classes
  def oblig_count
    Lesson.where(grade: [5..10], ltype: 1).count
  end

  # Basic Selection Classes
  def basic_ch_count
    Lesson.where(grade: [5..10], ltype: 2).count
  end

  # General Selection Classes
  def gen_ch_count
    Lesson.where(grade: [5..10], ltype: 3).count
  end

  # Special Selection Classes
  def spe_ch_count
    Lesson.where(grade: [5..10], ltype: 4).count
  end

  def th_count
    Lesson.where(grade: [5..10], ltype: 5).count
  end
end
