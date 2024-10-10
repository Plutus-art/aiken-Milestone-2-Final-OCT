test fun testMintNFT() {
  let creator = Address.new("addr_test1...");
  let metadata = ByteArray.new("metadata of NFT");
  
  let mintedNFT = NFTMarketplace.mintNFT(creator, metadata);
  
  assert_eq(mintedNFT.creator, creator);
  assert_eq(mintedNFT.metadata, metadata);
}
