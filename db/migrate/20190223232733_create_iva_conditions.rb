class CreateIvaConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :iva_conditions, comment: 'Porcentaje en la facturacion, responsables inscriptos se discrimina el 21% ' do |t|
    	t.string :condition, :limit => 50
      t.integer :porcent
      t.string :comment
      t.boolean :active, :default => true
      
      t.timestamps
    end
  end
end
