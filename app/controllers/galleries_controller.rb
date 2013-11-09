# encoding: utf-8

class GalleriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]  
  
  def initialize(*params)
    super(*params)
    @style="board/gallery/index"
    @script="board/gallery/index"
    @board_name='수정이 갤러리'
  end
  
  # GET /galleries
  # GET /galleries.json
  def index
    if(params[:gallery_category_id])
      categoryId=params[:gallery_category_id].to_i
    else
      categoryId=GalleryCategory.find(:first).id
    end
    
    @galleries = Gallery.where(:gallery_category_id=>categoryId).order('id desc').page(params[:page]).per(10)
    @gallery_categories=GalleryCategory.all
    @categoryId=categoryId        
            
    if(params[:id])
      @gallery = Gallery.find(params[:id])
    else
      @gallery=@galleries[0]
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @galleries }
    end
  end

    # GET /galleries/1
    # GET /galleries/1.json
    def show
        @gallery = Gallery.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render :json => @gallery }
        end
    end

    # GET /galleries/new
    # GET /galleries/new.json
    def new
        @gallery = Gallery.new   
        @gallery_categories=GalleryCategory.all
                   
        
        respond_to do |format|
            format.html # new.html.erb
            format.json { render :json => @gallery }
        end
    end

    # GET /galleries/1/edit
    def edit
    @gallery = Gallery.find(params[:id])
    @gallery_categories=GalleryCategory.all           
    end

    # POST /galleries
    # POST /galleries.json
    def create
        @gallery = Gallery.new(params[:gallery])     

        respond_to do |format|
            if @gallery.save
                format.html { redirect_to galleries_url, :notice=> @controller_name +t(:message_success_insert)}
                format.json { render :json => @gallery, :status => :created, :location => @gallery }
            else
                format.html { render :action => "new" }
                format.json { render :json => @gallery.errors, :status => :unprocessable_entity }
            end
        end
    end

    # PUT /galleries/1
    # PUT /galleries/1.json
    def update
        @gallery = Gallery.find(params[:id])

        respond_to do |format|
            if @gallery.update_attributes(params[:gallery])
                format.html { redirect_to @gallery, :notice=> @controller_name +t(:message_success_update)}
                format.json { head :ok }
            else
                format.html { render :action => "edit" }
                format.json { render :json => @gallery.errors, :status => :unprocessable_entity }
            end
        end
    end

    # DELETE /galleries/1
    # DELETE /galleries/1.json
    def destroy
        @gallery = Gallery.find(params[:id])
        @gallery.destroy

        respond_to do |format|
            format.html { redirect_to galleries_url }
            format.json { head :ok }
        end
    end
end
