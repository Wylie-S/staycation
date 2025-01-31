class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star, default: 1
      t.references :room, foreign_key: true
      t.references :reservations, foreign_key: true
      t.references :guest, foreign_key: true
      t.references :host, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
