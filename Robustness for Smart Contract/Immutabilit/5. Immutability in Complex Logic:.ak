-- Function to calculate the total value of NFTs in a list without modifying the original list
calculateTotalValue : List NFT -> Value
calculateTotalValue nftList =
    List.foldl (\acc nft -> acc + getPrice(nft)) 0 nftList
