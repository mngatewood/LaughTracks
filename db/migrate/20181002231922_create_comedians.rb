class CreateComedians < ActiveRecord::Migration[5.2]
  def change

    create_table :comedians do |c|
      c.text :name
      c.integer :age
      c.text :city

      c.timestamps null: false
    end
    
  end
end
