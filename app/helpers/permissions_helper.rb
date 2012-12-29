module PermissionsHelper
  def permission_collection
    permission_col = []
    permission_list.each_with_index { |cat, index|
      permission_col.append([index, cat])
    }
    permission_col
  end

  def permission_list
    [
        "Administrator",
        "Sunday School",
        "TBD"
    ]
  end

  def permission_id
    {
        :admin => 0,
        :ss => 1,
        :tbd => 2
    }
  end
end
