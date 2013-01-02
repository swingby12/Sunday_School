class SsClassSessionNotesController < ApplicationController
  # GET /ss_class_session_notes
  # GET /ss_class_session_notes.json
  def index
    @ss_class_session_notes = SsClassSessionNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ss_class_session_notes }
    end
  end

  # GET /ss_class_session_notes/1
  # GET /ss_class_session_notes/1.json
  def show
    @ss_class_session_note = SsClassSessionNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ss_class_session_note }
    end
  end

  # GET /ss_class_session_notes/new
  # GET /ss_class_session_notes/new.json
  def new
    @ss_class_session_note = SsClassSessionNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ss_class_session_note }
    end
  end

  # GET /ss_class_session_notes/1/edit
  def edit
    @ss_class_session_note = SsClassSessionNote.find(params[:id])
  end

  # POST /ss_class_session_notes
  # POST /ss_class_session_notes.json
  def create
    @ss_class_session_note = SsClassSessionNote.new(params[:ss_class_session_note])

    respond_to do |format|
      if @ss_class_session_note.save
        format.html { redirect_to @ss_class_session_note.ss_class_session.ss_class, notice: 'New file uploaded.' }
        format.json { render json: @ss_class_session_note, status: :created, location: @ss_class_session_note }
      else
        format.html { render action: "new" }
        format.json { render json: @ss_class_session_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ss_class_session_notes/1
  # PUT /ss_class_session_notes/1.json
  def update
    @ss_class_session_note = SsClassSessionNote.find(params[:id])

    respond_to do |format|
      if @ss_class_session_note.update_attributes(params[:ss_class_session_note])
        format.html { redirect_to @ss_class_session_note, notice: 'Ss class session note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ss_class_session_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ss_class_session_notes/1
  # DELETE /ss_class_session_notes/1.json
  def destroy
    @ss_class_session_note = SsClassSessionNote.find(params[:id])
    ss_class = @ss_class_session_note.ss_class_session.ss_class
    @ss_class_session_note.destroy

    respond_to do |format|
      format.html { redirect_to ss_class }
      format.json { head :no_content }
    end
  end
end
