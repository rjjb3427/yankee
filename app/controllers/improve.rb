# encoding: utf-8

class Improve < ActiveRecord::Base
  attr_accessible :title,:content
  validates_presence_of :title,:content,:message=>'필수값이 입력되지 않았습니다.'     
end
