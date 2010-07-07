class SubmissionsController < ApplicationController
  helper :all

  def index
    @survey = Survey.find(params[:survey_id])
    @submissions = @survey.submissions
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @submission = @survey.submissions.build
  end

  def run
    @submission = Submission.find(params[:id])
    @submission.answers.destroy
    @submission.start_time = Time.now
    @submission.save
    redirect_to new_submission_answer_path @submission
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @submission = @survey.submissions.build(params[:submission])
    if @submission.save
      redirect_to :action => 'run', :id => @submission.id
    else
      render :action => "new"
    end
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update_attributes(params[:submission])
      redirect_to @submission, :notice => 'Saved changes.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @survey = @submission.survey
    @submission.destroy
    redirect_to survey_submissions_path(@survey)
  end
end
