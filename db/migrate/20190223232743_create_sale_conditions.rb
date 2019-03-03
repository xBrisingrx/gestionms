class CreateSaleConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_conditions, comment: 'Descuentos que se le puede llegar a hacer a un cliente.' do |t|
      t.string :condition, :limit => 50
      t.float :porcent
      t.string :comment
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
