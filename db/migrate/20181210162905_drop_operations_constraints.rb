class DropOperationsConstraints < ActiveRecord::Migration
  def change
    %i[liabilities assets revenues expenses].each do |op|
      change_column_null(op, :reference_id, true)
      change_column_null(op, :reference_type, true)
    end
  end
end

