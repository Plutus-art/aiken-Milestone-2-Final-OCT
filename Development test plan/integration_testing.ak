test auction_completion {
  let auction = Auction.new(1, 3000) -- create auction
  place_bid(1, 4000)
  place_bid(1, 5000)
  
  end_auction(1)

  assert nft_owner == highest_bidder
  assert seller_balance == initial_seller_balance + 5000
}
