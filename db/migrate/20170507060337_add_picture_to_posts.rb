class AddPictureToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :picture_url, :string
  end
end
