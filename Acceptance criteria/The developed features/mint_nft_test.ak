test fun testMintNFT() {
  let creator = Address.new("addr_test1...");
  let metadata = ByteArray.new("metadata of NFT");
  
  let mintedNFT = NFTMarketplace.mintNFT(creator, metadata);

  // Verifying that the NFT is minted with the correct attributes
  assert_eq(mintedNFT.creator, creator);
  assert_eq(mintedNFT.metadata, metadata);
}


// Test Case Result: Passed
// The NFT was created correctly with the appropriate creator and metadata.
// Test Case Result: Failed
// Possible Reasons:
// The metadata could be incorrectly encoded.
// The creator address might not match due to a bug in how addresses are handled.
// Fix: Modify how inputs are handled in the mintNFT function and retest.
