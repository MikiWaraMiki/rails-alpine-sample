# 料金
class Domain::Model::Price::Fare
  attr_reader :amount

  def initialize(amount)
    if (amount % 10 != 0)
      raise ArgumentError.new('invalid number')
    end

    @amount = amount
  end

  def child_price
    child_amount_result = (amount.value / 2).to_i

    child_amount = Domain::Model::Price::Amount.adjust(child_amount_result)

    Domain::Model::Price::Fare.new(
      child_amount
    )
  end
end
