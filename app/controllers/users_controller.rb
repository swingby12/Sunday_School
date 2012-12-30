class UsersController < ApplicationController
  helper PermissionsHelper
  # GET /users
  # GET /users.json
  def index
    if request.xhr?
      @users = User.order("name_first ASC").where("name_first like ? OR name_last like ?", "%#{params[:q]}%", "%#{params[:q]}%")

      results = @users.map(&:attributes)
      results = @users.map{|u| {:name => [u.name_first, u.name_last].join(' '), :id => u.id}}
      #results = results.map(&:attributes)
      respond_to do |format|
        format.json { render :json => results  }
      end
    else
      unless user_permission[:admin][:read]
        not_found
      end
      @users = User.order("name_first ASC").all
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    unless user_permission[:admin][:read] or (current_user.id == @user.id)
      not_found
    end

    # Previously Taken Classes
    @prev_classes = SsClassSession.joins(:users).group(:class_id).where("\"users\".\"id\" = #{@user.id}")
    @prev_classes_count = @prev_classes.count

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html{ render "_form"}
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html{ render "_form"}
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Initialization
        if User.count == 1
          @admin_per = Permission.new(
            :category => 0, # 0 should be admin
            :can_read => true,
            :can_write => true,
            :user_id => @user.id
          )
          @admin_per.save
        end
        sign_in @user
        flash[:success] = "Welcome Back"
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "_form" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    unless user_permission[:admin][:read] or (current_user.id == @user.id)
      not_found
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        sign_in @user
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    unless user_permission[:admin][:write]
      not_found
    end
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
