class RemoveYearEstablishedFromOrchestras < ActiveRecord::Migration[5.2]
  def change
    remove_column :orchestras, :year_established, :datetime
  end
end
