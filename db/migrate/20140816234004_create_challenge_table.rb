class CreateChallengeTable < ActiveRecord::Migration
	def change
		create_table :challenges do |t|
			t.string :name, :password
			t.datetime :start_date
			t.timestamps
		end
	end
end
