# encoding: utf-8

class QuestionAnswersController < AnonCommentController
  def show   
    @question_answer = QuestionAnswer.find(params[:id])
    @parent=@question_answer.question
    return @question_answer
  end
  
  def edit
    @question_answer=QuestionAnswer.find(params[:id])
    @question = @question_answer.question
    return @question_answer
  end
  
  def create
    @question = Question.find(params[:question_id])
    if(current_user)
      params[:question_answer][:user_id]=current_user.id
    end    
    @questionAnswer = @question.question_answer.create(params[:question_answer])
    redirect_to question_path(@question)
  end
  
  def update
    @question_answer = QuestionAnswer.find(params[:id])
    
    respond_to do |format|
      if @question_answer.update_attributes(params[:question_answer])
        format.html { redirect_to @question_answer.question, :notice=> @controller_name +t(:message_success_update)}
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @question_answer.errors, :status => :unprocessable_entity }
      end
    end
  end  
 
  def destroy
    @questionAnswer = QuestionAnswer.find(params[:id])
    @questionAnswer.destroy
    redirect_to question_path(@questionAnswer.question)
  end
end
