class AddImageToTvs < ActiveRecord::Migration[6.1]
  def change
    add_column :tvs, :image, :string
  end
end
