class AnswersController < ApplicationController
  def index
    @submission = Submission.find(params[:submission_id])
    @answers = @submission.answers
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @submission = Submission.find(params[:submission_id])
    @question = @submission.next_question
    if @question.nil?
      @submission.end_time = Time.now
      @submission.save
      render :action => 'done'
    else
      @answer = @submission.answers.build
    end
  end

  def create
    @submission = Submission.find(params[:submission_id])
    @answer = @submission.answers.build(params[:answer])

    if @answer.save
      redirect_to new_submission_answer_path @submission
    else
      @submission.answers.delete(@answer)
      @question = @submission.next_question
      render :action => "new"
    end
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to @answer, :notice => 'Saved changes.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @submission = @answer.submission
    @answer.destroy
    redirect_to submission_answers_path(@submission)
  end

  def done
  end
end
