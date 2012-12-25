module SsClassesHelper

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
end
