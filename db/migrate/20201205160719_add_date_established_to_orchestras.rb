class AddDateEstablishedToOrchestras < ActiveRecord::Migration[5.2]
  def change
    add_column :orchestras, :date_established, :datetime
  end
end
