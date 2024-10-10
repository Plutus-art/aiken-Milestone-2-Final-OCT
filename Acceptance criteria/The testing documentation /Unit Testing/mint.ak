test fun testMintNFT() {
  let creator = Address.new("addr_test1...");
  let metadata = ByteArray.new("NFT Metadata");

  let mintedNFT = NFTMarketplace.mintNFT(creator, metadata);

  // Verifying the NFT is minted correctly
  assert_eq(mintedNFT.creator, creator);
  assert_eq(mintedNFT.metadata, metadata);
}
