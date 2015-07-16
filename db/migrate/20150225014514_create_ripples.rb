class CreateRipples < ActiveRecord::Migration
  def change
    create_table :ripples do |t|
      t.string :name
      t.string :website
      t.text :message

      t.timestamps
    end
  end
end
