# encoding: utf-8

class User < ActiveRecord::Base
  attr_accessible :email,:name,:admin,:password,:password_confirmation,:remember_me,:description
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end

