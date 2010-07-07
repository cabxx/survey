class QuestionsController < ApplicationController
  def index
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions
  end

  def show
    @question = Question.find(params[:id])
    @survey = @question.survey
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build(params[:question])
    if @question.save
      redirect_to @question
    else
      render :action => "new"
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to @question, :notice => 'Saved changes.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @survey = @question.survey
    @question.destroy
    redirect_to survey_questions_path(@survey)
  end
end
