require 'spec_helper'

describe Challenge do
	context 'Validations' do
		it { should validate_presence_of :name }
		it { should validate_presence_of :password }
		it { should validate_presence_of :start_date }
	end
	context 'Associations' do
		it { should have_many :users }
		it { should have_many :workouts }
	end
end