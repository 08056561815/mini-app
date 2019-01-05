class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string      :nickname
      t.text        :text
      t.timestamps  null: true
    end
  end
end
