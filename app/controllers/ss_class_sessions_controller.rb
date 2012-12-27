class SsClassSessionsController < ApplicationController
  # GET /ss_class_sessions
  # GET /ss_class_sessions.json
  def index
    @ss_class_sessions = SsClassSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ss_class_sessions }
    end
  end

  # GET /ss_class_sessions/1
  # GET /ss_class_sessions/1.json
  def show
    @ss_class_session = SsClassSession.find(params[:id])
    @ss_class = SsClass.find(@ss_class_session.class_id  )
    @instructors = @ss_class.instructors

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ss_class_session }
    end
  end

  # GET /ss_class_sessions/new
  # GET /ss_class_sessions/new.json
  def new
    @ss_class_session = SsClassSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ss_class_session }
    end
  end

  # GET /ss_class_sessions/1/edit
  def edit
    @ss_class_session = SsClassSession.find(params[:id])
  end

  # POST /ss_class_sessions
  # POST /ss_class_sessions.json
  def create
    @ss_class_session = SsClassSession.new(params[:ss_class_session])
    @instructors = SsClass.find(@ss_class_session.class_id).instructors

    @success = @ss_class_session.save

    respond_to do |format|
      format.js
    end
  end

  # PUT /ss_class_sessions/1
  # PUT /ss_class_sessions/1.json
  def update
    @ss_class_session = SsClassSession.find(params[:id])

    respond_to do |format|
      if @ss_class_session.update_attributes(params[:ss_class_session])
        format.html { redirect_to @ss_class_session, notice: 'Ss class session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ss_class_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ss_class_sessions/1
  # DELETE /ss_class_sessions/1.json
  def destroy
    @ss_class_session = SsClassSession.find(params[:id])
    ss_class_id = @ss_class_session.class_id
    ss_session_date = @ss_class_session.date
    @ss_class_session.destroy

    respond_to do |format|
      flash[:error] = "Class on #{ss_session_date} is removed"
      format.html { redirect_to ss_class_path(ss_class_id) }
      format.json { head :no_content }
    end
  end
end
