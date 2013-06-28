class CreateTables < ActiveRecord::Migration
  def change
    create_table :users  do |t|
      t.string :name, :null => false
      t.string :login, :null => false
      t.string :password_hash, :null => false
      t.timestamps
    end
    create_table :rounds  do |t|
      t.belongs_to :deck
      t.belongs_to :user
      t.timestamps
    end
    create_table :guesses  do |t|
      t.boolean :correct
      t.belongs_to :card
      t.belongs_to :round
      t.timestamps
    end
    create_table :decks  do |t|
      t.string :name, :null => false
      t.timestamps
    end
    create_table :cards  do |t|
      t.string :question, :null => false
      t.string :answer, :null => false
      t.belongs_to :deck
      t.timestamps
    end
  end
end
