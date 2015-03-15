require_relative 'restful_service_proxy'

class CustomerRestfulProxy < RestfulServiceProxy
  def get_all
    puts "GETTING all entities via GET http://api/customers"
    [{:name => "Aaron" }, {:name => "Jack"}, {:name => "Terry"}]
  end

  def get_by_id(id)
    puts "GETTING entity via GET http://api/customers/#{id}"
    {:name => "Aaron" }
  end

  def insert(entity)
    puts "INSERTING entity via POST http://api/customers"
    puts entity
    puts "INSERTED entity"
    entity
  end

  def update(entity)
    puts "UPDATING entity via PUT http://api/customers/#{entity[:id]}" 
    puts entity
    puts "UPDATING entity"
    entity
  end

  def delete(id)
    puts "DELETING entity via DELETE http://api/customers/#{id}" 
    puts id
    puts "DELETING entity"
  end
end
