test fun testBuyNFTWithRewards() {
  let seller = Address.new("addr_test1...");
  let buyer = Address.new("addr_test2...");
  let price = Value.lovelace(1000000);

  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("metadata of NFT"));
  let listing = NFTMarketplace.listNFT(nft, seller, price);

  let payment = Value.lovelace(1000000);
  let result = NFTMarketplaceWithRewards.buyNFTWithRewards(listing, buyer, payment);

  assert(is_ok(result));
  match result {
    Ok((nft, reward)) => {
      assert_eq(nft.creator, buyer);
      assert_eq(reward.amount, Value.new("PT", 1000)); // Reward amount should be 1000 PT
    },
    Err(_) => assert(False, "Failed to buy NFT with rewards")
  }
}
