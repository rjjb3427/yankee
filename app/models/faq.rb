# encoding: utf-8

class Faq < ActiveRecord::Base
  attr_accessible :title,:faq_category_id,:faq_content_attributes
  belongs_to :faq_category, :dependent=>:delete,:autosave=>true  
  has_one :faq_content, :foreign_key => :id
  accepts_nested_attributes_for :faq_content, :allow_destroy => true
  validates_presence_of :title,:message=>'필수값이 입력되지 않았습니다.'  
end
