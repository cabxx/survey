class Choice < ActiveRecord::Base
  belongs_to :question
  validates_presence_of :content
end
