# encoding: utf-8

class QuestionsController < AnonBoardController
  include SecretBoard
  before_filter :check_secret, :only => [:show]
  
  def initialize(*params)
    super(*params)
    @meta_description='예쁘고 귀여운 수정이의 질문,답변 게시판입니다.'    
    @controller_name='수정이에게 질문'
  end  
  
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @questions }
    end
  end
  
  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @question_answers=@question.question_answer.order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @question }
    end
  end
  
  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
    @question.build_question_content
    @script="board/new"
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @question }
    end
  end
  
  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end
  
  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    
    if current_user
      @question.user_id=current_user.id
    end 
    
    respond_to do |format|
      if @question.save
        session[@question.class.name]||={} 
        session[@question.class.name][:guest_pass_id]||=[]
        session[@question.class.name][:guest_pass_id]<<@question.id
        format.html { redirect_to @question, :notice=> @controller_name +t(:message_success_insert)}
        format.json { render :json => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])
    
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, :notice=> @controller_name +t(:message_success_update)}
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :ok }
    end
  end
end
