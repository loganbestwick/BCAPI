class Workout < ActiveRecord::Base
	attr_protected
	belongs_to :user
	belongs_to :challenge
end