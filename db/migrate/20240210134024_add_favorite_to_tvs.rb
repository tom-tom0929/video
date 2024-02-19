class AddFavoriteToTvs < ActiveRecord::Migration[6.1]
  def change
    add_column :tvs, :favorite, :string
  end
end
