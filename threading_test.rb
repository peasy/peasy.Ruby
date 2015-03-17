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

#customer_data_proxy = CustomerRestfulProxy.new
customer_data_proxy = CustomerDatabaseProxy.new

service = CustomerService.new(customer_data_proxy)

commands = []
commands << service.insert_command({:id => 1, :name => ""})
commands << service.insert_command({:id => 2, :name => "Foo Bar"})
commands << service.insert_command({:id => 3, :name => ""})
commands << service.insert_command({:id => 4, :name => "Mikasaessucasa"})
commands << service.insert_command({:id => 5, :name => "John"})
commands << service.insert_command({:id => 6, :name => ""})
commands << service.insert_command({:id => 7, :name => ""})
commands << service.insert_command({:id => 8, :name => "meh"})
commands << service.insert_command({:id => 9, :name => ""})
commands << service.insert_command({:id => 10, :name => "Aargssssssssss"})
commands << service.insert_command({:id => 11, :name => ""})

results = []
#threads = commands.map { |command| Thread.new(command) { |command| results << command.execute } }
mutex = Mutex.new
threads = commands.map do |command|
  Thread.new(command) do |command|
    mutex.synchronize do
      results << command.execute
    end
  end
end
threads.each { |t| t.join }

results.each { |result| puts result.inspect }
