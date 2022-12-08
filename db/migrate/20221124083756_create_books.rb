class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.column :title, :string
      t.column :synposis, :text
    #   t.belongs_to :author, null: false, foreign_key: :true
      t.timestamps
    end
  end
end
