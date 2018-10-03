class CreateSpecials < ActiveRecord::Migration[5.2]
  def change

    create_table :specials do |s|
      s.text :title
      s.integer :runtime
      s.text :thumbnail
      s.integer :comedian_id

      s.timestamps null: false
    end

  end
end
