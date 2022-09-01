class ChangeTitleInBlogs < ActiveRecord::Migration[7.0]
  def change
    change_column :blogs, :title, :integer
  end
end
