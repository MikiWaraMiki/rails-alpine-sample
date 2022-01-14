# 金額の数量
class Domain::Model::Price::Amount
  attr_reader value

  # intなんでもOK
  def initialize(value)
    # マイナスにはならない
    if (value < 0)
      raise new ArugmentError('invalid number')
    end

    @value = value
  end

  def self.adjust(amount)
    result = amount - (amount % 10)

    return self.new(
      result
    )
  end
end
