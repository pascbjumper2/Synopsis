class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.string :host
      t.string :shared

      t.timestamps
    end
  end
end
