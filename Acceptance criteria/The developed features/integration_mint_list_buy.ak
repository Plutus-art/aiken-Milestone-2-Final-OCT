 test fun testIntegrationMintListBuy() {
  let seller = Address.new("addr_test1...");
  let buyer = Address.new("addr_test2...");
  let price = Value.lovelace(1000000);

  // Minting an NFT
  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("metadata of NFT"));

  // Listing the NFT
  let listing = NFTMarketplace.listNFT(nft, seller, price);
  assert_eq(listing.isActive, True);

  // Buying the NFT
  let payment = Value.lovelace(1000000);
  let result = NFTMarketplace.buyNFT(listing, buyer, payment);

  // Verifying the end-to-end transaction
  assert(is_ok(result));
  match result {
    Ok(nft) => assert_eq(nft.creator, buyer),
    Err(_) => assert(False, "Integration test failed for mint, list, buy")
  }
}

//Test Case Result: Passed
// The features (mint, list, and buy) work correctly together in the marketplace.
// Test Case Result: Failed
// Possible Reasons:
// Issues with state transitions between features (e.g., listing not marked as sold after purchase).
// Fix: Debug the transitions and ensure proper state management between features.