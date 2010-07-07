class Survey < ActiveRecord::Base
  validates_presence_of :name
  has_many :questions, :order => 'created_at'
  has_many :submissions, :order => 'created_at desc'
end
