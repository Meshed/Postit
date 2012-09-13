class SorceryCore < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string,          :null => false, :default => ''  # if you use another field as a username, for example email, you can safely remove this field.
    add_column :users, :crypted_password, :string,  :default => nil
    add_column :users, :salt, :string,              :default => nil
  end

  def self.down
    drop_table :users
  end
end