require 'spec_helper'

describe User do
	context 'Validations' do
		it { should validate_presence_of :email }
		it { should validate_presence_of :password }
		it { should validate_presence_of :first_name }
	end
	context 'Associations' do
		it { should have_many :workouts }
		it { should belong_to :challenge }
	end
end