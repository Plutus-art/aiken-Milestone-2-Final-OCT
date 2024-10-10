-- Function to generate a formatted metadata string for an NFT
generateMetadataString : NFT -> String
generateMetadataString nft =
    String.concat [
        "NFT ID: ", String.fromInt(nft.id),
        ", Owner: ", PubKeyHash.toString(nft.owner),
        ", Metadata: ", nft.metadata
    ]
