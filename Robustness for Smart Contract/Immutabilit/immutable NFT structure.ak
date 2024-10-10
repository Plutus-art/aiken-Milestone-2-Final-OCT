-- Defining an immutable NFT structure
type NFT = { id: Int, owner: PubKeyHash, metadata: String }

-- Creating a new immutable NFT
createNFT : PubKeyHash -> String -> NFT
createNFT owner metadata =
    let
        nftId = generateUniqueId()  -- Generates a unique NFT ID
    in
        { id = nftId, owner = owner, metadata = metadata }