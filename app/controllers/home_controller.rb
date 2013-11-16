# encoding: utf-8

class HomeController < ApplicationController
  
  def initialize
    super
    @script="application"
  end

  def index
    @good_byes = Goodbye.order('id desc').page(params[:page]).per(5)
    @notices = Notice.order('id desc').page(params[:page]).per(5)
    @questions = Question.order('id desc').page(params[:page]).per(5)    
    @galleries = Gallery.order('id desc').page(params[:page]).per(20)
  end
end