class User < ActiveRecord::Base
	attr_protected
	has_many :workouts
	belongs_to :challenge
end