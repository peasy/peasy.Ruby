class RuleBase
  attr_reader :is_valid, 
              :error_message, 
              :successor, 
              :if_valid_then_execute, #The action to perform once when this rule passes validation.
              :if_invalid_then_execute #The action to perform once when this rule fails validation.

  def validate
    on_validate
    if is_valid
      if successor
        successor.validate()
        is_valid = successor.is_valid
        error_message = successor.error_message
      end
      #if @if_valid_then_execute
        #@if_valid_then_execute.call(self)
        #@if_valid_then_execute = nil
      #end
    #else
      #if @if_invalid_then_execute
        #@if_invalid_then_execute.call(self)
        #@if_invalid_then_execute = nil
      #end
    end
    return self
  end

  def if_valid_then_validate(rule)
    @successor = rule
  end

  #def if_valid_then_execute(&method)
    #@if_valid_then_execute = method
  #end

  #def if_invalid_then_execute(&method)
    #@if_invalid_then_execute = method 
  #end

  protected 

  def on_validate
    raise "on_validate must be implemented"
  end

end
