class RemovePokePrefixFromSenderReceiver < ActiveRecord::Migration
  def change
  	remove_column :pokes, :poke_sender_id, :integer
  	remove_column :pokes, :poke_receiver_id, :integer

  	change_table :pokes do |t|
  		t.references :sender
  		t.references :receiver
  	end
  end
end
