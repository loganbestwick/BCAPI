require 'spec_helper'

describe Workout do
	context 'Validations' do
		it { should validate_presence_of :time_start }
		it { should validate_presence_of :time_end }
		it { should validate_presence_of :duration }
		it { should validate_presence_of :challenge_id }
		it { should validate_presence_of :user_id }
	end

	context 'Associations' do
		it { should belong_to :user }
		it { should belong_to :challenge }
	end
end