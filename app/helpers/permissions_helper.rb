module PermissionsHelper
  def permission_collection
    permission_col = []
    permission_list.each_with_index { |cat, index|
      permission_col.append([index, cat])
    }
    return permission_col
  end

  def permission_list
    return [
        "Sunday School",
        "TBD"
    ]
  end
end
