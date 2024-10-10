test "auction NFT with valid bids" {
    // Arrange
    let auctioneer = addr("addr_test1...")
    let bidder = addr("addr_test2...")
    let nft = mint_nft(auctioneer, "AuctionNFT")
    
    // Act
    list_nft_for_auction(nft, auctioneer)
    place_bid(nft, bidder, 1000)
    
    // End Auction
    end_auction(nft)
    
    // Assert
    assert_eq(nft.owner, bidder)
}
