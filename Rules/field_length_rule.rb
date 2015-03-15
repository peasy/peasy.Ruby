require_relative '../rule_base'

class FieldLengthRule < RuleBase
  def initialize(entity, field, length, display="")
    @entity = entity
    @field = field
    @length = length
    @display = display
  end

  def on_validate
    @is_valid = @entity[@field].length <= @length
    @error_message = "#{@field} must be equal to or less than #{@length} characters"
    @is_valid 
  end
end
