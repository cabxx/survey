class Submission < ActiveRecord::Base
  belongs_to :survey
  has_many :questions, :order => 'created_at', :through => :survey
  has_many :answers, :order => 'created_at'
  has_many :choices, :order => 'created_at', :through => :answers
  validates_presence_of :name

  def next_question
    question = nil
    if answers.count == 0
      question = questions.first
    elsif answers.count > 0
      i = answers.last.choice.next
      if i.nil? || i < 0
        p = questions.index(answers.last.question)
        i = p + 1 unless p.nil?
      elsif i == 0
        i = nil
      else
        i = i - 1
      end
      if !i.nil? && i < questions.count && i >= 0
        question = questions[i]
      end
    end
    question
  end

  def score
    choices.sum(:score)  # cache in row for faster
  end
end
