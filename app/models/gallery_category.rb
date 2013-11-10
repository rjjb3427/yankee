# encoding: utf-8

class GalleryCategory < ActiveRecord::Base
  attr_accessible :title
  validates_presence_of :title 
  has_many :gallery
end
