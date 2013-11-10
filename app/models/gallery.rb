# encoding: utf-8

require 'carrierwave/orm/activerecord'

class Gallery < ActiveRecord::Base
  attr_accessible :gallery_category_id, :title  
  validates_presence_of :gallery_category_id, :title, :photo
  belongs_to :gallery_category
  mount_uploader :photo, GalleryPhotoUploader
end