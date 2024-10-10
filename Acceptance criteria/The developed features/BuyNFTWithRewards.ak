test fun testBuyNFTWithRewards() {
  let seller = Address.new("addr_test1...");
  let buyer = Address.new("addr_test2...");
  let price = Value.lovelace(1000000);

  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("metadata of NFT"));
  let listing = NFTMarketplace.listNFT(nft, seller, price);

  let payment = Value.lovelace(1000000);
  let result = NFTMarketplaceWithRewards.buyNFTWithRewards(listing, buyer, payment);

  // Verifying NFT transfer and reward
  assert(is_ok(result));
  match result {
    Ok((nft, reward)) => {
      assert_eq(nft.creator, buyer);
      assert_eq(reward.amount, Value.new("PT", 1000)); // Buyer should receive 1000 PT
    },
    Err(_) => assert(False, "Failed to buy NFT with rewards")
  }
}


//Test Case Result: Passed
// The buyer successfully receives the NFT and is rewarded with 1000 PT tokens.
// Test Case Result: Failed
// Possible Reasons:
// Incorrect reward distribution (e.g., wrong token amount or type).
// Fix: Validate the token distribution mechanism and ensure proper reward calculation.
