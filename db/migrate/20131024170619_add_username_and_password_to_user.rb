class AddUsernameAndPasswordToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :username
  		t.string :password_hash
  		t.string :password_salt
  	end
  end
end
