# encoding: utf-8

class SiteController < ApplicationController
  def initialize(*params)
    super(*params)   
    @controller_name=t('activerecord.models.site')
    @meta_description='예쁘고 귀여운 수정이의 사진첩입니다.'   
  end

  def index
    
  end
end
