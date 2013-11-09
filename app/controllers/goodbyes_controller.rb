class GoodbyesController < ApplicationController
  # GET /goodbyes
  # GET /goodbyes.json
  def index
    @goodbyes = Goodbye.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goodbyes }
    end
  end

  # GET /goodbyes/1
  # GET /goodbyes/1.json
  def show
    @goodbye = Goodbye.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goodbye }
    end
  end

  # GET /goodbyes/new
  # GET /goodbyes/new.json
  def new
    @goodbye = Goodbye.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goodbye }
    end
  end

  # GET /goodbyes/1/edit
  def edit
    @goodbye = Goodbye.find(params[:id])
  end

  # POST /goodbyes
  # POST /goodbyes.json
  def create
    @goodbye = Goodbye.new(params[:goodbye])

    respond_to do |format|
      if @goodbye.save
        format.html { redirect_to @goodbye, :notice=> @controller_name +t(:message_success_insert)}
        format.json { render json: @goodbye, status: :created, location: @goodbye }
      else
        format.html { render action: "new" }
        format.json { render json: @goodbye.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goodbyes/1
  # PUT /goodbyes/1.json
  def update
    @goodbye = Goodbye.find(params[:id])

    respond_to do |format|
      if @goodbye.update_attributes(params[:goodbye])
        format.html { redirect_to @goodbye, :notice=> @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goodbye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goodbyes/1
  # DELETE /goodbyes/1.json
  def destroy
    @goodbye = Goodbye.find(params[:id])
    @goodbye.destroy

    respond_to do |format|
      format.html { redirect_to goodbyes_url }
      format.json { head :no_content }
    end
  end
end
