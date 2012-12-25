class SsClassesController < ApplicationController


  # GET /ss_classes
  # GET /ss_classes.json
  def index
    @ss_classes = SsClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ss_classes }
    end
  end

  # GET /ss_classes/1
  # GET /ss_classes/1.json
  def show
    @ss_class = SsClass.find(params[:id])
    @ss_sessions = @ss_class.ss_class_sessions

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
end

# Create new class session within the table
def new_session
  @ss_class = SsClass.find(params[:id])
  respond_to do |format|
    format.js { render :layout=>false }
  end
end