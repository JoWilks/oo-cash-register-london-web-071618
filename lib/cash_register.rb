class CashRegister

  attr_accessor :total

  def initialize(employee_discount = 0)
  #set total to 0 and give option for employee discount, which otherwise will default to 0.
    @total = 0
    @employee_discount = employee_discount
  end

  def discount
  #call discount, which will be the employee discount, if not given with initializing will = 0
    @employee_discount
  end

  def apply_discount
  #check to see if discount is no zero, if so apply it and return msg, otherwise return msg about no discount.
    if discount != 0
      @total -= (@total * discount/100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
  #return items array.
    @items
  end

  def add_item(title, price, quantity = 1)
  #increase total by price of items * quantity added by this function.
    @total += price * quantity
  #store price of latest transaction for void_last_transaction.
    @price = price
  #create array if no items have been added yet.
    @items = [] if @items == nil
  # check if quantity it greater than 1 if so add as many items as there is quantity to @item.
    if quantity > 1
      for i in 1..quantity
        @items << title
      end
    else
      @items << title
    end
  end

  def void_last_transaction
    @total -= @price
  end

end
