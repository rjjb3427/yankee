# encoding: utf-8

class Admin::BlogsController < Admin::AdminController
  def initialize(*params)
    super(*params)
    @controller_name='수정이 요리'
  end
  
  # GET /admin/blogs
  # GET /admin/blogs.json
  def index
    @admin_blog_categories=BlogCategory.all
    
    if(params[:blog_category_id])
      @categoryId=params[:blog_category_id].to_i
    else
      if @admin_blog_categories[0]
        @categoryId=@admin_blog_categories[0].id.to_i
      else
        @categoryId=nil        
      end
    end
    
    @admin_blogs = Blog.where(:blog_category_id=>@categoryId).order('id desc').page(params[:page]).per(5)
         
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_blogs }
    end
  end

  # GET /admin/blogs/1
  # GET /admin/blogs/1.json
  def show
    @admin_blog = Blog.find(params[:id])
    @admin_blog_comments=@admin_blog.blog_comment.order('id desc').page(params[:page]).per(10)         

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_blog }
    end
  end

  # GET /admin/blogs/new
  # GET /admin/blogs/new.json
  def new
    @admin_blog = Blog.new
    @admin_blog.build_blog_content
    @admin_blog_categories=BlogCategory.all
    @script='board/new'
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_blog }
    end
  end

  # GET /admin/blogs/1/edit
  def edit
    @admin_blog = Blog.find(params[:id])
    @admin_blog_categories=BlogCategory.all
    @admin_blog_category_id=@admin_blog.blog_category.id    
    @script='board/edit'
  end

  # POST /admin/blogs
  # POST /admin/blogs.json
  def create
    @admin_blog = Blog.new(params[:blog])

    respond_to do |format|
      if @admin_blog.save
        format.html { redirect_to @admin_blog, notice: '요리법이 작성되었습니다.' }
        format.json { render json: @admin_blog, status: :created, location: @admin_blog }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/blogs/1
  # PUT /admin/blogs/1.json
  def update
    @admin_blog = Blog.find(params[:id])

    respond_to do |format|
      if @admin_blog.update_attributes(params[:blog])
        format.html { redirect_to @admin_blog, notice: '요리법이 수정되었습니다.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/blogs/1
  # DELETE /admin/blogs/1.json
  def destroy
    @admin_blog = Blog.find(params[:id])
    @admin_blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end
end
