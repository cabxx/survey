class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices, :order => 'created_at'
  validates_presence_of :content
end
