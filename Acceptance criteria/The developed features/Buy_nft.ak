test fun testBuyNFT() {
  let seller = Address.new("addr_test1...");
  let buyer = Address.new("addr_test2...");
  let price = Value.lovelace(1000000);

  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("metadata of NFT"));
  let listing = NFTMarketplace.listNFT(nft, seller, price);

  // Simulating buyer sending correct amount of ADA
  let payment = Value.lovelace(1000000);
  let result = NFTMarketplace.buyNFT(listing, buyer, payment);

  // Verifying that the NFT was transferred to the buyer
  assert(is_ok(result));
  match result {
    Ok(nft) => assert_eq(nft.creator, buyer),
    Err(_) => assert(False, "Failed to buy NFT")
  }
}


// Test Case Result: Passed
// The NFT is transferred to the buyer upon successful payment.
// Test Case Result: Failed
// Possible Reasons:
// Payment amount mismatch.
// Incorrect buyer address or invalid listing state (e.g., inactive or already purchased).
// Fix: Adjust payment validation logic or state transition for the listing (e.g., from active to inactive after sale).
