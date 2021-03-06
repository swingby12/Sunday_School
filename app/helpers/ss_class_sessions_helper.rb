module SsClassSessionsHelper
  def view_session_date
    if user_permission[:ss][:write] or is_instructor?
      best_in_place @ss_class_session, :date, :type => :date
    else
      @ss_class_session.date
    end
  end

  def view_session_instructor
    if user_permission[:ss][:write] or is_instructor?
      best_in_place @ss_class_session,
                    :instructor_id,
                    :type => :select,
                    :collection => @instructors.collect { |u| [u.id, u.name] }
    else
      @ss_class_session.instructor.name
    end
  end
end
