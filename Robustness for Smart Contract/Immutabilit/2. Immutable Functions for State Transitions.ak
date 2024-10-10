-- Function to transfer ownership of an NFT
transferOwnership : NFT -> PubKeyHash -> NFT
transferOwnership nft newOwner =
    { nft with owner = newOwner }
