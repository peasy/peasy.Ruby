require_relative "../../data_proxy"

class RestfulServiceProxy < DataProxy
  def get_all
    raise "get_all must be implemented"
  end

  def get_by_id(id)
    raise "get_by_id must be implemented"
  end

  def insert(state)
    raise "insert must be implemented"
  end

  def update(state)
    raise "update must be implemented"
  end

  def delete(id)
    raise "delete must be implemented"
  end
end
