@entry
func list_nft_for_sale(nft_data: NFTData) {
    let listing_id = create_listing(nft_data);
    emit NFTListed(listing_id, nft_data.owner);
}

func finalize_sale(listing_id: ListingID) {
    let nft_id = mint_nft(listing_data);
    emit NFTSold(nft_id);
}