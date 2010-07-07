class ChoicesController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @choices = @question.choices
  end

  def show
    @choice = Choice.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @choice = @question.choices.build
  end

  def edit
    @choice = Choice.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @choice = @question.choices.build(params[:choice])
    if @choice.save
      redirect_to question_choices_path(@question)
    else
      render :action => "new"
    end
  end

  def update
    @choice = Choice.find(params[:id])
    if @choice.update_attributes(params[:choice])
      redirect_to @choice, :notice => 'Saved changes.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @choice = Choice.find(params[:id])
    @question = @choice.question
    @choice.destroy
    redirect_to question_choices_path(@question)
  end
end
