require_relative '../rule_base'

class FieldLengthRule < RuleBase
  def initialize(entity, field, length, display="")
    @entity = entity
    @field = field
    @length = length
    @display = display
  end

  def on_validate
    puts @entity[@field].length
    @is_valid = @entity[@field].length <= @length
    puts @is_valid
    @error_message = "#{@field} must be equal to or less than #{@length} characters"
    puts @error_message 
    return @is_valid 
  end
end
