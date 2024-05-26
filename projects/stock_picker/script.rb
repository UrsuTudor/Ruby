require "pry-byebug"

def stock_picker(array)
  buy_and_sell_days = []

  #needed outside of the loops so they don't get redeclared on every iteration
  highest_profit = 0
  buy_day = 0
  sell_day = 0

  array.each do |number|
    #only added for readability
    buy_price = number
    
    array.each do |sell_price|
      #makes sure the function doesn't take into account days that come after the 
      #curent iteration, since you can't buy in the past
      next if array.index(sell_price) < array.index(number)

      if highest_profit < sell_price - buy_price
        highest_profit = sell_price - buy_price
        buy_day = array.index(buy_price)
        sell_day = array.index(sell_price)
      end
    end
  end

  buy_and_sell_days.push(buy_day)
  buy_and_sell_days.push(sell_day)

  p buy_and_sell_days
end

stock_picker([17,3,6,9,15,8,6,1,10])