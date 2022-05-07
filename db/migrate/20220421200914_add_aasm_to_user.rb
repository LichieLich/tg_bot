class AddAasmToUser < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :search_chain, :string)
  end
end
