class CreateUserTable < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :email, :password, :first_name, :last_name
			t.integer :total_burpees, :total_time, :num_workouts, :best_time, :challenge_id
			t.boolean :notifications?, :default => true
			t.timestamps
			t.belongs_to :challenge	
		end
	end
end
