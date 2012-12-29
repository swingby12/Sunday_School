module SsClassesHelper

  def view_name
    if user_permission[:ss][:write]
      best_in_place @ss_class, :name
    else
      @ss_class.name
    end
  end

  def view_year
    if user_permission[:ss][:write]
      best_in_place @ss_class, :year
    else
      @ss_class.year
    end
  end

  def view_quarter
    if user_permission[:ss][:write]
      best_in_place @ss_class,
                    :quarter,
                    :type => :select,
                    :collection => [[1,'Q1'],[2,'Q2'],[3,'Q3'],[4,'Q4']]
    else
      "Q#{@ss_class.quarter}"
    end
  end

  def view_book
    if user_permission[:ss][:write]
      best_in_place @ss_class,
                    :bible_id,
                    :type => :select,
                    :collection => bible_collection
    else
      bible_list[@ss_class.bible_id]
    end
  end

  def view_btn_new_session
    if user_permission[:ss][:write] || is_instructor?
      link_to 'Create New Session',
        {
          :action => 'new_session',
          :controller => 'ss_classes'
        },
        :remote => true,
        :class => "btn btn-primary"
    end
  end

  def view_btn_attendance
    if user_permission[:ss][:read] || is_instructor?
      link_to 'View Attendance',
        {
          :action => 'attendance',
          :controller => 'ss_classes'
        },
        :class => "btn btn-info"
    end
  end

  def instructor_list(instructors)
    raw(parse_instructors(instructors))
  end

  private


  def parse_instructors(instructors)
    list_of_instructor = []
    instructors.each do |instructor|
      list_of_instructor.push( link_to instructor.name, instructor)
    end
    output_str = ""
    list_of_instructor.each do |inst|
      output_str += (inst == list_of_instructor.last) ? inst : "#{inst}, "
    end
    return output_str
  end

  # Return collection of Bible with index
  def bible_collection
    bible_col = []
    bible_list.each_with_index { |book, index|
      bible_col.append([index, book])
    }
    return bible_col
  end

  # List of all Books in the Bible in order
  def bible_list
    bible_list_sym.map{|l| t("bible.#{l}")}
  end
  def bible_list_sym
    [
      :gen    ,
      :exod   ,
      :lev    ,
      :num    ,
      :deut   ,
      :josh   ,
      :judg   ,
      :rth    ,
      :sam1   ,
      :sam2   ,

      :kings1 ,
      :kings2 ,
      :chron1 ,
      :chron2 ,
      :ezra   ,
      :neh    ,
      :esth   ,
      :job    ,
      :pslm   ,
      :prov   ,
      :eccles ,

      :sos    ,
      :isa    ,
      :jer    ,
      :lam    ,
      :eze    ,
      :dan    ,
      :hos    ,
      :joel   ,
      :amos   ,
      :obad   ,

      :jon    ,
      :micah  ,
      :nah    ,
      :hab    ,
      :zeph   ,
      :hag    ,
      :zec    ,
      :mal    ,
      :matt   ,
      :mark   ,

      :luk    ,
      :john   ,
      :acts   ,
      :rom    ,
      :cor1   ,
      :cor2   ,
      :gal    ,
      :eph    ,
      :php    ,
      :col    ,

      :th1    ,
      :th2    ,
      :tim1   ,
      :tim2   ,
      :tit    ,
      :phm    ,
      :heb    ,
      :jas    ,
      :pet1   ,
      :pet2   ,

      :jn1    ,
      :jn2    ,
      :jn3    ,
      :jud    ,
      :rev
    ]
  end
end
