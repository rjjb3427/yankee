# encoding: utf-8

class FaqContent < ActiveRecord::Base
  belongs_to :faq,:autosave=>true  
  accepts_nested_attributes_for :faq, :allow_destroy => true
  validates_presence_of :content
end
