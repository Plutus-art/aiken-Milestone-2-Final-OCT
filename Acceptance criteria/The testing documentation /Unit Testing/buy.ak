test fun testBuyNFT() {
  let seller = Address.new("addr_test1...");
  let buyer = Address.new("addr_test2...");
  let price = Value.lovelace(1000000);

  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("NFT Metadata"));
  let listing = NFTMarketplace.listNFT(nft, seller, price);

  let payment = Value.lovelace(1000000);
  let result = NFTMarketplace.buyNFT(listing, buyer, payment);

  // Verifying the NFT is transferred to the buyer
  assert(is_ok(result));
  match result {
    Ok(nft) => assert_eq(nft.creator, buyer),
    Err(_) => assert(False, "Failed to buy NFT")
  }
}
