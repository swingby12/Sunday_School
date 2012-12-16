class SsInstructorsController < ApplicationController
  # GET /ss_instructors
  # GET /ss_instructors.json
  def index
    @ss_instructors = SsInstructor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ss_instructors }
    end
  end

  # GET /ss_instructors/1
  # GET /ss_instructors/1.json
  def show
    @ss_instructor = SsInstructor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ss_instructor }
    end
  end

  # GET /ss_instructors/new
  # GET /ss_instructors/new.json
  def new
    @ss_instructor = SsInstructor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ss_instructor }
    end
  end

  # GET /ss_instructors/1/edit
  def edit
    @ss_instructor = SsInstructor.find(params[:id])
  end

  # POST /ss_instructors
  # POST /ss_instructors.json
  def create
    @ss_instructor = SsInstructor.new(params[:ss_instructor])

    respond_to do |format|
      if @ss_instructor.save
        format.html { redirect_to @ss_instructor, notice: 'Ss instructor was successfully created.' }
        format.json { render json: @ss_instructor, status: :created, location: @ss_instructor }
      else
        format.html { render action: "new" }
        format.json { render json: @ss_instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ss_instructors/1
  # PUT /ss_instructors/1.json
  def update
    @ss_instructor = SsInstructor.find(params[:id])

    respond_to do |format|
      if @ss_instructor.update_attributes(params[:ss_instructor])
        format.html { redirect_to @ss_instructor, notice: 'Ss instructor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ss_instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ss_instructors/1
  # DELETE /ss_instructors/1.json
  def destroy
    @ss_instructor = SsInstructor.find(params[:id])
    @ss_instructor.destroy

    respond_to do |format|
      format.html { redirect_to ss_instructors_url }
      format.json { head :no_content }
    end
  end
end
