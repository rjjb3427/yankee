# encoding: utf-8

class Contact < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :user
  has_one :contact_content, :foreign_key => :id, :dependent => :destroy  
  accepts_nested_attributes_for :contact_content, :allow_destroy => true  
end
