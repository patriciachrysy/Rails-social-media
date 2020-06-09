class CreateLikings < ActiveRecord::Migration[6.0]
  def change
    create_table :likings do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
