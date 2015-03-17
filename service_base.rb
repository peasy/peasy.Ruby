require_relative "command"
require_relative "Rules/greater_than_integer_rule"

class ServiceBase

  def initialize(data_proxy)
    @data_proxy = data_proxy  
  end

  def get_by_id_command(id)
    Command.new(Proc.new { get_by_id(id) }, Proc.new { rules_for_get_by_id(id) })
  end

  def get_all_command
   Command.new(Proc.new { get_all }, Proc.new { rules_for_get_all })
  end

  def insert_command(entity)
    Command.new(Proc.new { insert(entity) }, Proc.new { rules_for_insert(entity) })
  end

  def update_command(entity)
    Command.new(Proc.new { update(entity) }, Proc.new { rules_for_update(entity) })
  end

  def delete_command(id)
    Command.new(Proc.new { delete(id) }, Proc.new { rules_for_delete(id) })
  end

  protected

  def get_by_id(id)
    @data_proxy.get_by_id(id)
  end

  def get_all
    @data_proxy.get_all
  end

  def insert(entity)
    @data_proxy.insert(entity)
  end

  def update(entity)
    #current = get_by_id(entity[:id])
    #current.revert_non_editable_fields()
    @data_proxy.update(entity)
  end

  def delete(id) 
    @data_proxy.delete(id)
  end

  def rules_for_get_by_id(id)
    [ GreaterThanIntegerRule.new(:id, id, 0) ]
  end

  def rules_for_get_all
    []
  end

  def rules_for_insert(entity)
    []
  end

  def rules_for_update(entity)
    [ FieldRequiredRule.new(entity, :id)
                       .if_valid_then_validate(GreaterThanIntegerRule.new(:id, entity[:id], 0)) ]
  end

  def rules_for_delete(id)
    [ GreaterThanIntegerRule.new(:id, id, 0) ]
  end

end


