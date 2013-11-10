# encoding: utf-8

class Faq < ActiveRecord::Base
  attr_accessible :faq_category_id, :title
  validates_presence_of :faq_category_id, :title  
  belongs_to :faq_category, :dependent=>:delete,:autosave=>true  
  has_one :faq_content, :foreign_key => :id
  accepts_nested_attributes_for :faq_content, :allow_destroy => true
end
