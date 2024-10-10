test place_bid_failure_too_low {
  let auction = Auction.new(1, 3000) -- initialize auction
  let result = place_bid(1, 2000)

  assert result == Err(TooLowBid)
}
