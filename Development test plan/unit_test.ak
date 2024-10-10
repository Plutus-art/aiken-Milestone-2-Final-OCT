fn place_bid(auction_id: AuctionId, bid: u64) -> Result<Bid, Error> {
  if bid < auction.current_price {
    return Err(TooLowBid)
  } else {
    // Update auction with new bid
    auction.bids.push(bid)
    auction.current_price = bid
    Ok(Bid { auction_id, bid })
  }
}
