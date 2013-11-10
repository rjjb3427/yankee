# encoding: utf-8

class Goodbye < ActiveRecord::Base
  attr_accessible :title
  validates_presence_of :title    
end
