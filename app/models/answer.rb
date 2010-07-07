class Answer < ActiveRecord::Base
  belongs_to :submission
  belongs_to :choice
  validates_presence_of :submission
  validates_presence_of :choice

  def question
    choice.question
  end
end
