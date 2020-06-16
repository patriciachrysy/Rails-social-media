class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.string :book_name
      t.string :book_author
      t.date :published_at
      t.string :book_link
      t.text :content

      t.timestamps
    end
  end
end
