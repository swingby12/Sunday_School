class SsClassesController < ApplicationController
  include PermissionsHelper
  helper_method :check_class_permission

  # GET /ss_classes
  # GET /ss_classes.json
  def index
    @ss_classes = SsClass.by_year(params[:year]).by_bible_id(params[:book]).by_name(params[:name])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ss_classes }
    end
  end

  # GET /ss_classes/1
  # GET /ss_classes/1.json
  def show
    @ss_class = SsClass.find(params[:id])
    @ss_sessions = @ss_class.ss_class_sessions.order('date ASC')
    @instructors = @ss_class.instructors

    check_class_permission

    @ss_instructor = SsInstructor.new
    @users = User.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ss_class }
    end
  end

  # GET /ss_classes/new
  # GET /ss_classes/new.json
  def new
    @ss_class = SsClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ss_class }
    end
  end

  # GET /ss_classes/1/edit
  def edit
    @ss_class = SsClass.find(params[:id])
  end

  # POST /ss_classes
  # POST /ss_classes.json
  def create
    @ss_class = SsClass.new(params[:ss_class])

    respond_to do |format|
      if @ss_class.save
        format.html { redirect_to @ss_class, notice: 'Ss class was successfully created.' }
        format.json { render json: @ss_class, status: :created, location: @ss_class }
      else
        format.html { render action: "new" }
        format.json { render json: @ss_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ss_classes/1
  # PUT /ss_classes/1.json
  def update
    @ss_class = SsClass.find(params[:id])

    respond_to do |format|
      if @ss_class.update_attributes(params[:ss_class])
        format.html { redirect_to @ss_class, notice: 'Ss class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ss_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ss_classes/1
  # DELETE /ss_classes/1.json
  def destroy
    @ss_class = SsClass.find(params[:id])
    @ss_class.destroy

    respond_to do |format|
      format.html { redirect_to ss_classes_url }
      format.json { head :no_content }
    end
  end

  # Create new class session within the table
  def new_session
    @ss_class = SsClass.find(params[:id])
    respond_to do |format|
      format.js { render :layout=>false }
    end
  end
  # GET /ss_classes/1/attendance
  # GET /ss_classes/1.json
  def attendance
    @ss_class = SsClass.find(params[:id])
    @ss_sessions = @ss_class.ss_class_sessions.order('date ASC')

    @arr_data = Hash.new(false)
    @students = []
    @ss_sessions.each do |session|
      users = session.users
      users.each do |u|
        unless @arr_data[session.id]
          @arr_data[session.id] = Hash.new(false)
        end
        @arr_data[session.id][u.id] = true
      end
      @students |= users
    end

    @users = User.all

    respond_to do |format|
      format.html { render action: "attendance" }
    end
  end

  ##### Heler Functions #####

  # Define permission variables upon user
  # Permission is determined from permission table
  # If an user is also an instructor for that particular class, both permissions are given
  def check_class_permission
    p = Permission.where(:category => permission_id[:ss]).where(:user_id => current_user.id).first
    @permission = Hash.new
    if p
      @permission[:write] = p.can_write
      @permission[:create] = p.can_create
    end
    @ss_class.instructors.each do |instructor|
      if instructor.id == current_user.id
        @permission[:write] = true
        @permission[:create] = true
        return
      end
    end
  end
end

