# encoding: utf-8

class Faq < ActiveRecord::Base
  belongs_to :faq_category, :dependent=>:delete,:autosave=>true  
  has_one :faq_content, :foreign_key => :id
  accepts_nested_attributes_for :faq_content, :allow_destroy => true
  validates_presence_of :title
end
