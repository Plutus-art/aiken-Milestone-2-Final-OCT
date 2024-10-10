func handle_secondary_sale(nft_id: NFTID, sale_price: Amount) {
    let royalty = calculate_royalty(nft_id, sale_price);
    pay_creator(nft_id.creator, royalty);
}
