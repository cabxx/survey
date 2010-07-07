module SubmissionsHelper
  def response_min_str(submission)
    if submission.end_time
      ((submission.end_time - submission.start_time) /
        60.0).round_with_precision(2).to_s + ' min'
    else
      ''
    end
  end
end
