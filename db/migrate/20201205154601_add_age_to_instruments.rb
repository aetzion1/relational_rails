class AddAgeToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :age, :integer
  end
end
