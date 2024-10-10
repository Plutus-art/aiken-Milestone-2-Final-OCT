test fun testListNFT() {
  let seller = Address.new("addr_test1...");
  let price = Value.lovelace(1000000); // 1 ADA in lovelace

  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("metadata of NFT"));
  let listing = NFTMarketplace.listNFT(nft, seller, price);

  assert_eq(listing.seller, seller);
  assert_eq(listing.price, price);
  assert(listing.isActive);
}
