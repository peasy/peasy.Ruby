require_relative "command_base"

class ServiceBase

  def initialize(data_proxy)
    @data_proxy = data_proxy  
  end

  def get_by_id_command(id)
    CommandBase.new(get_by_id(id), rules_for_get_by_id(id))
  end

  def get_all_command
   CommandBase.new(get_all, rules_for_get_all)
  end

  def insert_command(entity)
    CommandBase.new(insert(entity), rules_for_insert(entity))
  end

  def update_command(entity)
    CommandBase.new(update(entity), rules_for_update(entity))
  end

  def delete_command(id)
    CommandBase.new(delete(id), rules_for_delete(id))
  end

  protected

  def get_by_id(id)
    return Proc.new do
      @data_proxy.get_by_id(id)
    end
  end

  def rules_for_get_by_id(id)
    return Proc.new { [] }
  end

  def get_all
    return Proc.new do
      @data_proxy.get_all
    end
  end

  def rules_for_get_all
    return Proc.new { [] }
  end

  def insert(entity)
    return Proc.new do 
      @data_proxy.insert(entity)
    end
  end

  def rules_for_insert(entity)
    return Proc.new { [] } 
  end

  def update(entity)
    return Proc.new do 
      @data_proxy.update(entity)
    end
  end

  def rules_for_update(entity)
    #return Proc.new do
      ## return entity_must_contain_id_field_rule
    #end
    return Proc.new { [] } 
  end

  def delete(id) 
    return Proc.new do 
      @data_proxy.delete(id)
    end
  end

  def rules_for_delete(id)
    return Proc.new { [] } 
  end
end


