class User < ActiveRecord::Base
	attr_protected
	has_many :workouts
	belongs_to :challenge
	validates_presence_of :email, :password, :first_name
end