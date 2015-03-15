require_relative "active_record_data_proxy"

class CustomerDatabaseProxy < ActiveRecordDataProxy
  def get_all
    puts "GETTING all entities from database"
    [{:name => "Aaron" }, {:name => "Jack"}, {:name => "Terry"}]
  end

  def get_by_id(id)
    puts "GETTING entity from database #{id}"
    {:name => "Aaron" }
  end

  def insert(entity)
    puts "INSERTING entity into database"
    puts entity
    puts "INSERTED entity"
    entity
  end

  def update(entity)
    puts "UPDATING entity in database"
    puts entity
    puts "UPDATING entity"
    entity
  end

  def delete(id)
    puts "DELETING entity in database"
    puts id
    puts "DELETING entity"
  end
end
