# encoding: utf-8

class Improve < ActiveRecord::Base
  attr_accessible :title  
  validates_presence_of :title,:content
end
