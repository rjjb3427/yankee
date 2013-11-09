# encoding: utf-8

class FaqCategory < ActiveRecord::Base
  has_many :faq
  validates_presence_of :title 
end
