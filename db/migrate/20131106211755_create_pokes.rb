class CreatePokes < ActiveRecord::Migration
  def change
    create_table :pokes do |t|
    	t.references :poke_sender
    	t.references :poke_receiver

      t.timestamps
    end
  end
end
