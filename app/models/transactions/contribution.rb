class Contribution < Transaction
  
  def initialize(hTrx)
    rval = super()
    pp "Constructor input fields: ",hTrx
    return rval
  end
end