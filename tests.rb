require_relative "command"
require_relative "execution_result"
require_relative "service_base"
require_relative "DataProxies/DatabaseProxies/customer_database_proxy"
require_relative "DataProxies/RestfulServiceProxies/customer_restful_proxy"
require_relative "Rules/field_length_rule"
require_relative "Rules/field_required_rule"

class CustomerService < ServiceBase
  def initialize(data_proxy)
    super(data_proxy)
  end
  def rules_for_insert(entity)
    rules = []
    rules << FieldRequiredRule.new(entity, :name)
                              .if_valid_then_execute(lambda { |rule| puts "WOOT!" })
                              .if_valid_then_validate(FieldLengthRule.new(entity, :name, 10)
                                                                     .if_invalid_then_execute(lambda { |rule| puts "ARGH!!" }))
    rules
  end
end

customer_data_proxy = CustomerRestfulProxy.new
#customer_data_proxy = CustomerDatabaseProxy.new

service = CustomerService.new(customer_data_proxy)
result = service.insert_command({:name => "jldkjdfsl"}).execute
puts result.inspect

#result = service.get_by_id_command(1).execute
#puts result.inspect

#result = service.get_all_command.execute
#puts result.inspect

#result = service.update_command({:id => 1, :name => "Aaron"}).execute
#puts result.inspect

#result = service.delete_command(1).execute
#puts result.inspect
