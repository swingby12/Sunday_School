class SsAttendancesController < ApplicationController
  # GET /ss_attendances
  # GET /ss_attendances.json
  def index
    @ss_attendances = SsAttendance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ss_attendances }
    end
  end

  # GET /ss_attendances/1
  # GET /ss_attendances/1.json
  def show
    @ss_attendance = SsAttendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ss_attendance }
    end
  end

  # GET /ss_attendances/new
  # GET /ss_attendances/new.json
  def new
    @ss_attendance = SsAttendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ss_attendance }
    end
  end

  # GET /ss_attendances/1/edit
  def edit
    @ss_attendance = SsAttendance.find(params[:id])
  end

  # POST /ss_attendances
  # POST /ss_attendances.json
  def create
    @ss_attendance = SsAttendance.new(params[:ss_attendance])

    respond_to do |format|
      if @ss_attendance.save
        format.html { redirect_to @ss_attendance, notice: 'Ss attendance was successfully created.' }
        format.json { render json: @ss_attendance, status: :created, location: @ss_attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @ss_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ss_attendances/1
  # PUT /ss_attendances/1.json
  def update
    @ss_attendance = SsAttendance.find(params[:id])

    respond_to do |format|
      if @ss_attendance.update_attributes(params[:ss_attendance])
        format.html { redirect_to @ss_attendance, notice: 'Ss attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ss_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ss_attendances/1
  # DELETE /ss_attendances/1.json
  def destroy
    @ss_attendance = SsAttendance.find(params[:id])
    @ss_attendance.destroy

    respond_to do |format|
      format.html { redirect_to ss_attendances_url }
      format.json { head :no_content }
    end
  end
end
