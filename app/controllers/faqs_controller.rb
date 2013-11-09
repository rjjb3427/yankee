# encoding: utf-8

class FaqsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  
  def initialize(*params)
    super(*params)
    @style="board/faq/index"
    @board_name='수정이 FAQ'
  end
  
  # GET /faqs
  # GET /faqs.json
  def index
    @faq_categories = FaqCategory.all
    
    if(params[:faq_category_id])
      categoryId=params[:faq_category_id]
    else
      categoryId=FaqCategory.find(:first)
    end
    
    @faqs = Faq.where(:faq_category_id=>categoryId).order('id desc').page(params[:page]).per(10)
    
    if(params[:id])
      @faq = Faq.find(params[:id])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faqs }
    end
  end

    # GET /faqs/1
    # GET /faqs/1.json
    def show
        @faq = Faq.find(params[:id])


        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @faq }
        end
    end

    # GET /faqs/new
    # GET /faqs/new.json
    def new
        @faq = Faq.new
        @faq.build_faq_content        
        @faq_categories = FaqCategory.all  

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @faq }
        end
    end

    # GET /faqs/1/edit
    def edit
        @faq = Faq.find(params[:id])
    end

    # POST /faqs
    # POST /faqs.json
    def create
        @faq = Faq.new(params[:faq])

        respond_to do |format|
            if @faq.save
                format.html { redirect_to faqs_url, :notice=> @controller_name +t(:message_success_insert)}
                format.json { render json: @faq, status: :created, location: @faq }
            else
                format.html { render action: "new" }
                format.json { render json: @faq.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /faqs/1
    # PUT /faqs/1.json
    def update
        @faq = Faq.find(params[:id])

        respond_to do |format|
            if @faq.update_attributes(params[:faq])
                format.html { redirect_to @faq, :notice=> @controller_name +t(:message_success_update)}
                format.json { head :ok }
            else
                format.html { render action: "edit" }
                format.json { render json: @faq.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /faqs/1
    # DELETE /faqs/1.json
    def destroy
        @faq = Faq.find(params[:id])
        @faq.destroy

        respond_to do |format|
            format.html { redirect_to faqs_url }
            format.json { head :ok }
        end
    end
end
