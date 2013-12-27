# encoding: utf-8

class IntroController < ApplicationController
  before_action :authenticate_user!, :except => [:index,:show]
  before_action :set_intro, only: [:show, :edit, :update, :destroy]  

  def initialize(*params)
    super(*params)   
    @controller_name=t('activerecord.models.intro')
    
    get_menu('intro')    
  end 
  
  # GET /intro
  # GET /intro.json  
  def index
    @intro=Intro.page(params[:page]).per(15)
    
    @script='intro'    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @intro }
    end
  end
  
  # GET /intro/1
  # GET /intro/1.json
  def show
  end

  # GET /intro/new
  def new
    @intro = Intro.new
  end

  # GET /intro/1/edit
  def edit
  end

  # POST /intro
  # POST /intro.json
  def create
    @intro = Intro.new(intro_params)

    respond_to do |format|
      if @intro.save
        format.html { redirect_to intro_index_url, notice: @controller_name +t(:message_success_create)}
        format.json { render action: 'show', status: :created, location: @intro }
      else
        format.html { render action: 'new' }
        format.json { render json: @intro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intro/1
  # PATCH/PUT /intro/1.json
  def update
    respond_to do |format|
      if @intro.update(intro_params)
        format.html { redirect_to @intro, notice: @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @intro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intro/1
  # DELETE /intro/1.json
  def destroy
    @intro.destroy
    respond_to do |format|
      format.html { redirect_to intro_index_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_intro
    @intro = Intro.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def intro_params
    params.require(:intro).permit(:id,:title,:description)
  end
end
