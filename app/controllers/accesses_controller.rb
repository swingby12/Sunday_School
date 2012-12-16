class AccessesController < ApplicationController
  # GET /accesses
  # GET /accesses.json
  def index
    @accesses = Access.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accesses }
    end
  end

  # GET /accesses/1
  # GET /accesses/1.json
  def show
    @access = Access.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @access }
    end
  end

  # GET /accesses/new
  # GET /accesses/new.json
  def new
    @access = Access.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @access }
    end
  end

  # GET /accesses/1/edit
  def edit
    @access = Access.find(params[:id])
  end

  # POST /accesses
  # POST /accesses.json
  def create
    @access = Access.new(params[:access])

    respond_to do |format|
      if @access.save
        format.html { redirect_to @access, notice: 'Access was successfully created.' }
        format.json { render json: @access, status: :created, location: @access }
      else
        format.html { render action: "new" }
        format.json { render json: @access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accesses/1
  # PUT /accesses/1.json
  def update
    @access = Access.find(params[:id])

    respond_to do |format|
      if @access.update_attributes(params[:access])
        format.html { redirect_to @access, notice: 'Access was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accesses/1
  # DELETE /accesses/1.json
  def destroy
    @access = Access.find(params[:id])
    @access.destroy

    respond_to do |format|
      format.html { redirect_to accesses_url }
      format.json { head :no_content }
    end
  end
end
