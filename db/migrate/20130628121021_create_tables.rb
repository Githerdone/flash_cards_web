class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :login, :null => false
      t.string :password_hash, :null => false
      t.timestamps
    end
    create_table :rounds do |t|
      t.references :deck
      t.references :user
      t.timestamps
    end
    create_table :guesses do |t|
      t.boolean :correct
      t.references :card
      t.references :round
      t.timestamps
    end
    create_table :decks do |t|
      t.string :name
      t.timestamps
    end
    create_table :cards do |t|
      t.string :question, :null => false
      t.string :answer, :null => false
      t.references :deck
      t.timestamps
    end
  end
end
