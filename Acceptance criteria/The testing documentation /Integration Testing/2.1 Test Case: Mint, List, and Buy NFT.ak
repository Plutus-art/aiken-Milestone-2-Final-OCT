test fun testIntegrationMintListBuy() {
  let seller = Address.new("addr_test1...");
  let buyer = Address.new("addr_test2...");
  let price = Value.lovelace(1000000);

  // Mint an NFT
  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("NFT Metadata"));

  // List the NFT for sale
  let listing = NFTMarketplace.listNFT(nft, seller, price);
  assert_eq(listing.isActive, True);

  // Buy the NFT
  let payment = Value.lovelace(1000000);
  let result = NFTMarketplace.buyNFT(listing, buyer, payment);

  // Verifying the entire process
  assert(is_ok(result));
  match result {
    Ok(nft) => assert_eq(nft.creator, buyer),
    Err(_) => assert(False, "Failed in the mint, list, buy integration test")
  }
}
