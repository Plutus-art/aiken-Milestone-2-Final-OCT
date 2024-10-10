@entry
func batch_mint_nfts(nft_data: List<NFTData>) {
    // Ensure the list is not empty
    require(length(nft_data) > 0, "No NFT data provided");

    for data in nft_data {
        // Mint each NFT using the provided data
        let nft_id = mint_nft(data);
        
        // Emit an event for each NFT minted
        emit NFTMinted(nft_id, data.owner);
    }
}
