class RemoveNicknameToTweets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :nickname, :string
  end
end
