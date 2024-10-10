#  a rewards system for buyers using your native token "Plooty (PT)."

 contract NFTMarketplaceWithRewards {
  data Reward = {
    buyer: Address,
    amount: Value
  }

  // Function: Buy NFT and reward buyer with Plooty (PT)
  pub fun buyNFTWithRewards(listing: Listing, buyer: Address, payment: Value) -> Result<(NFT, Reward), String> {
    if listing.isActive && payment == listing.price {
      let nft = NFTMarketplace.buyNFT(listing, buyer, payment).unwrap();
      let reward = Reward { buyer: buyer, amount: Value.new("PT", 1000) }; // Reward 1000 PT tokens
      
      Result.Ok((nft, reward))
    } else {
      Result.Err("NFT is not available for sale or payment mismatch")
    }
  }
}
