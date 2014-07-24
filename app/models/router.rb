#Its should maps to the specified operations
class Router
  attr_reader :calculator
  def initialize calculator
    @calculator = calculator
  end

  def map parser
    case parser.operator
      when "add"
        @calculator.+ parser.operand
      when "subtract"
        @calculator.- parser.operand
      when "multiply"
        @calculator.* parser.operand
      when "divide"
        @calculator./ parser.operand
      when "cancel"
        @calculator.cancel
      else
        "Incorrect Command"
    end
  end
end