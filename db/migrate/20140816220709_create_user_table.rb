class CreateUserTable < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :email, :password, :first_name, :last_name
			t.integer :total_burpees, :default => 0
			t.integer :total_time, :default => 0
			t.integer :num_workouts, :default => 0
			t.integer :best_workout_id
			t.integer :challenge_id
			t.boolean :notifications, :default => true
			t.timestamps
			t.belongs_to :challenge	
		end
	end
end
