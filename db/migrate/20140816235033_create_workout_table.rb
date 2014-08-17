class CreateWorkoutTable < ActiveRecord::Migration
  def change
  	create_table :workouts do |t|
  		t.datetime :time_start, :time_end
  		t.integer :duration, :challenge_id, :user_id
  		t.integer :num_burpees, :default => 100
  		t.belongs_to :challenge, :user
  		t.timestamps
  	end
 	end
end
