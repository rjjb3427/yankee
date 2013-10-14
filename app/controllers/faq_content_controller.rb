# encoding: utf-8

class FaqsController < ApplicationController
    def initialize(*params)
        super(*params)
        @board_name='FAQ'
        @style="board/faq/index"
        @script="sl/essays"
    end

    # GET /faqs
    # GET /faqs.json
    def index
        @faq_categories = FaqCategory.all
        
        if(params[:faq_category_id])
          categoryId=params[:faq_category_id]
        else
          categoryId=FaqCategory.find(:first);
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
    
    def show 
      
    end
end
