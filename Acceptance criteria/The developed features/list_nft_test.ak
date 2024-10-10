test fun testListNFT() {
  let seller = Address.new("addr_test1...");
  let price = Value.lovelace(1000000); // 1 ADA in lovelace

  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("metadata of NFT"));
  let listing = NFTMarketplace.listNFT(nft, seller, price);

  // Verifying that the listing details are correct
  assert_eq(listing.seller, seller);
  assert_eq(listing.price, price);
  assert(listing.isActive);
}


//Test Case Result: Passed
// The NFT is listed with the correct price and marked as active.
// Test Case Result: Failed
// Possible Reasons:
// The NFT listing might not activate properly.
// Fix: Debug the isActive flag or price calculation logic to ensure correct functionality.
