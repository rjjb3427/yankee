# encoding: utf-8

class Admin::UsersController < Admin::AdminController
  def initialize(*params)
    super(*params)
    @controller_name='수정이 요리'
  end
   
  # GET /portfolios
  # GET /portfolios.json
  def index
    @portfolios = User.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @portfolios }
    end
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @portfolio }
    end
  end

  # GET /portfolios/new
  # GET /portfolios/new.json
  def new
    @portfolio = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portfolio }
    end
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio = User.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: @controller_name +t(:message_success_create) }
        format.json { render json: @portfolio, status: :created, location: @portfolio }
      else
        format.html { render action: "new" }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /portfolios/1
  # PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update_attributes(portfolio_params)
        format.html { redirect_to @portfolio, notice: @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio
    @portfolio = User.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def portfolio_params
    params.require(:portfolio).permit(:id, :url, :title, :description, :photo)
  end  
end
