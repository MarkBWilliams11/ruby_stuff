stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(array)
  profit = {} #=> our empty hash
  # first we need to buy then we can sell. so map for each buy and sell
  array.map.with_index do |buy_price, buy_day|
    array.map.with_index do |sell_price, sell_day|
      if sell_day > buy_day
        #=> when sell_day is greater we can create our array subtract prices to see what profits are
        profit[[buy_day, sell_day]] = sell_price - buy_price
      end
    end
  end
  results = profit.sort_by do |_days, profit| #=>using the sort_by method w/ key/value pairs of profit.
    profit #=> using values
  end
  #=>using sort puts largest number at the end
  best_profit = results.last #=>the lat element holds [[1,4],12] the key holds our days an the profit value of 12

  p "Buy on day #{best_profit[0][0]} ans sell on day #{best_profit[0][1]} for a profit of $#{best_profit[1]}"
  #=>"Buy on day 1 ans sell on day 4 for a profit of $12"
end
stock_picker(stock_prices)
