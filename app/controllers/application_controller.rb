# encoding: utf-8

class ApplicationController < ActionController::Base  
  protect_from_forgery with: :exception
  layout :layout
  before_filter :set_locale
  
  def initialize(*params)
    super(*params)
    @title='양키군인 한명도 없는 그날까지!!'
    @meta_robot='all, index, follow'
    @meta_application_name='주한미군 철수 홈페이지'
    @meta_description='주한미군 철수 홈페이지입니다.'
    @meta_keyword='미군,미군범죄,소파,SOFA,미군철수,북한,무기,분단,전쟁,군대,주둔,주둔비,분담,양키,Yankee'
    @style='application'
    @script='index'
  end
  
  def set_locale
     I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def layout
    if(params[:no_layout])
      return nil
    else
      return 'application'
    end
  end  
end
