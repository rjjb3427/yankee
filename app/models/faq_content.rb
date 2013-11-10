# encoding: utf-8

class FaqContent < ActiveRecord::Base
  attr_accessible :content  
  belongs_to :faq,:autosave=>true  
  accepts_nested_attributes_for :faq, :allow_destroy => true
  validates_presence_of :content
end
