class PermissionsController < ApplicationController
  before_filter :authorize

  # GET /permissions
  # GET /permissions.json
  def index
    @permissions = Permission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @permissions }
    end
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
    not_found
  end

  # GET /permissions/new
  # GET /permissions/new.json
  def new
    @permission = Permission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @permission }
    end
  end

  # GET /permissions/1/edit
  def edit
    not_found
    #@permission = Permission.find(params[:id])
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = Permission.new(params[:permission])

    respond_to do |format|
      if @permission.save
        format.html { redirect_to Permission, notice: 'Permission was successfully created.' }
        format.json { render json: @permission, status: :created, location: @permission }
      else
        format.html { render action: "new" }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /permissions/1
  # PUT /permissions/1.json
  def update
    @permission = Permission.find(params[:id])

    respond_to do |format|
      if @permission.update_attributes(params[:permission])
        #format.html { redirect_to @permission, notice: 'Permission was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: "edit" }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission = Permission.find(params[:id])
    @permission.destroy

    respond_to do |format|
      format.html { redirect_to permissions_url }
      format.json { head :no_content }
    end
  end

  def authorize
    unless user_permission[:admin][:read]
      not_found
    end
  end

end
