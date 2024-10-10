-- Test for secondary sale royalty payment
xfunc secondary_sale_test() -> Bool {
    let nft_id = NFTID("test_nft_001");
    let sale_price = Amount(1000);

    let sale_result = handle_secondary_sale(nft_id, sale_price);
    
    -- Assert the royalty payment was made
    assert(sale_result == True, "Secondary sale royalty failed.");
    
    return sale_result;
}
