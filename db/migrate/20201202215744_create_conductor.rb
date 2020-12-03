class CreateConductor < ActiveRecord::Migration[5.2]
  def change
    create_table :conductors do |t|
      t.string :name
      t.boolean :current_conductor
      t.integer :orchestra_id
      t.integer :years_in_residence
    end
  end
end
