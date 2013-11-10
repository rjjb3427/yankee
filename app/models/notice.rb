# encoding: utf-8

class Notice < ActiveRecord::Base
  attr_accessible :id, :user_id, :title  
  validates_presence_of :user_id, :title
  belongs_to :user,:autosave=>true
  has_one :notice_content, :foreign_key => :id
  has_many :notice_log
  accepts_nested_attributes_for :notice_content, :allow_destroy => true
end
