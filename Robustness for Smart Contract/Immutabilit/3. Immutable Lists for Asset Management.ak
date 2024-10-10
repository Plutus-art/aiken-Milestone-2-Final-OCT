-- Adding an NFT to an immutable list of NFTs
addNFTToList : NFT -> List NFT -> List NFT
addNFTToList nft nftList =
    nft :: nftList  -- Creates a new list with the NFT prepended to the existing list
