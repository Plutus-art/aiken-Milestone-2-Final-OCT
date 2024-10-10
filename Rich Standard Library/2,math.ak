-- Function to calculate the total price of multiple NFTs
calculateTotalPrice : List Value -> Value
calculateTotalPrice prices =
    List.foldl (+) 0 prices  -- Using fold function to sum the list of prices

-- Function to apply a discount to a given price
applyDiscount : Value -> Float -> Value
applyDiscount price discountPercent =
    price * (1 - discountPercent / 100.0)
