def stock_picker(array)
  # Creates an array with placeholders values for the result of the best trade we will return
  best_trade = [0, 0]

  profit = 0

  # Loops through the array, tracking the day and price of the buy
  array.each_with_index do |buy_price, buy_day|

    # Loops through the array, this time tracking the day and price of the sale
    array.each_with_index do |sell_price, sell_day|

      # If the index of the buy price is bigger than the index of the sell price, it's skipped in the iteration
      next if buy_day > sell_day

      if sell_price - buy_price > profit
        profit = sell_price - buy_price

        # Reassign the values in our best_trade array to the buy and sell indexes, which will be our best possible trade
        best_trade[0] = buy_day
        best_trade[-1] = sell_day
      end
    end
  end
  best_trade
end

p stock_picker([17,3,6,9,15,8,6,1,10]) #=> [1,4] for a profit of $15 - $3 = $12
p stock_picker([2,3,5,9,10,8,6,1,15]) #=> [7,8] for a profit of $15 - $1 = $14
p stock_picker([4,12,18,25,2,7,9,14]) #=> [0,3] for a profit of $25 - $4 = $21
p stock_picker([20,2,4,8,12,17,19,11]) #=> [1,6] for a profit of $19 - $2 = $17