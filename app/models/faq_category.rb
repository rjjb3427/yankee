# encoding: utf-8

class FaqCategory < ActiveRecord::Base
  attr_accessible :title
  validates_presence_of :title  
  has_many :faq
end
