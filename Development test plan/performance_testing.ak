test high_load_bidding {
  let auction = Auction.new(1, 3000)

  for i in 1..1000 do
    place_bid(1, 3000 + i)

  assert auction.bids.len() == 1000
}

