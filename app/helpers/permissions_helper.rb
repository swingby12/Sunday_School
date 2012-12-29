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

  def permission_type(id)
    permission_list[permission_id[id]]
  end

  def check_permission(key)
    @permission = Hash.new
    @permission[:type] = permission_type(key)
    if signed_in?
      p = Permission.where(:category => permission_id[key]).where(:user_id => current_user.id).first
      if p
        @permission[:write] = p.can_write
        @permission[:read] = p.can_read
      end
    end
  end

  def permission_key(key)
    perm = Hash.new
    if signed_in?
      p = Permission.where(:category => permission_id[key]).where(:user_id => current_user.id).first
      if p
        perm[:write] = p.can_write
        perm[:read] = p.can_read
      end
    end
    return perm
  end

  def generate_permission
    user_permission = Hash.new
    permission_id.each do |key, val|
      user_permission[key] = permission_key(key)
    end
    user_permission
  end

  def user_permission
    @user_permission ||= generate_permission
  end
end
