class CreateTvs < ActiveRecord::Migration[6.1]
  def change
    create_table :tvs do |t|
      t.string :name
      t.string :genre
      t.string :actor
      t.text :about
      t.string :title

      t.timestamps
    end
  end
end
