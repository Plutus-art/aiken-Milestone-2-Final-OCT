test fun testListNFT() {
  let seller = Address.new("addr_test1...");
  let price = Value.lovelace(1000000); // 1 ADA in Lovelace

  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("NFT Metadata"));
  let listing = NFTMarketplace.listNFT(nft, seller, price);

  // Verifying that the NFT is listed correctly
  assert_eq(listing.seller, seller);
  assert_eq(listing.price, price);
  assert_eq(listing.isActive, True);
}
