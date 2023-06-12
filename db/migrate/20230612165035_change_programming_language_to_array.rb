class ChangeProgrammingLanguageToArray < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :programming_language, :string, array: true, default: []
  end
end
