module LessonsHelper
  def avg_calc
    @lessons = current_user.lessons.where(grade: [5..10], selected: true)
    @sum = 0
    @lessons.each do |les|
      @sum += les.ects * les.grade.to_f
    end
    @avg = @sum / @lessons.sum(:ects) unless @lessons.sum(:ects).zero?
  end

  def sem_avg(i)
    current_user.lessons.where(semester: i, grade: [5..10]).average(:grade)
  end

  def avg_winter_semesters
    @sum = 0
    for i in 1..8
      @sum += sem_avg(i) if i.odd?
    end
    @sum / 4.0
  end

  def avg_summer_semesters
    @sum = 0
    for i in 1..8
      @sum += sem_avg(i) if i.even?
    end
    @sum / 4.0
  end

  #def category_avg
    #@cats = current_user.lessons.map{ |l| l.code.first(3) }.uniq
    #@averages = {}
    #@cats.each do |cat|
      #@avg = current_user.lessons.where('lesson.code.first(3) == cat', selected: true, grade: #[5..10]).count
      #@averages[cat] = @avg
  #  end
  #  @averages
  #end

  def avg_std
    current_user.lessons.where(ltype: 1, grade: [5..10]).average(:grade)
  end

  def avg_basic
    current_user.lessons.where(ltype: 2, grade: [5..10]).average(:grade)
  end

  def avg_gen
    current_user.lessons.where(ltype: 3, grade: [5..10]).average(:grade)
  end

  def avg_sp
    current_user.lessons.where(ltype: 4, grade: [5..10]).average(:grade)
  end

  # Obligatory Classes
  def oblig_count
    current_user.lessons.where(grade: [5..10], ltype: 1).count
  end

  # Basic Selection Classes
  def basic_ch_count
    current_user.lessons.where(grade: [5..10], ltype: 2).count
  end

  # General Selection Classes
  def gen_ch_count
    current_user.lessons.where(grade: [5..10], ltype: 3).count
  end

  # Special Selection Classes
  def spe_ch_count
    current_user.lessons.where(grade: [5..10], ltype: 4).count
  end

  def th_count
    current_user.lessons.where(grade: [5..10], ltype: 5).count
  end

  def passed
    current_user.lessons.where(grade: [5..10], selected: true)
  end

end
