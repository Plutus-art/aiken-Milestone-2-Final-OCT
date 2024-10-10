@entry
func batch_mint_nfts(nft_data: List<NFTData>) {
    for data in nft_data {
        let nft_id = mint_nft(data);
        emit NFTMinted(nft_id, data.owner);
    }
}
