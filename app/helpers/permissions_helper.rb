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

  def check_ss_permission
    p = Permission.where(:category => permission_id[:ss]).where(:user_id => current_user.id).first
    @permission = Hash.new
    if p
      @permission[:write] = p.can_write
      @permission[:create] = p.can_create
    end
  end
end
