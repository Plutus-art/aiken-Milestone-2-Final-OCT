-- Function to log an event when a new NFT is created
logNFTCreation : NFT -> ()
logNFTCreation nft =
    log("New NFT Created: " ++ generateMetadataString(nft))  -- Using log function from the library
