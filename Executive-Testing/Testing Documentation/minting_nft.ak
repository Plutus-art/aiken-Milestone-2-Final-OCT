-- Test for the NFT minting function
xfunc mint_nft_test() -> Bool {
    let nft_id = NFTID("test_nft_001");
    let owner = Address.from_bech32("addr_test1...");  -- Testnet address

    let mint_result = mint_nft(nft_id, owner);
    
    -- Assert that minting was successful
    assert(mint_result == True, "NFT minting failed.");
    
    return mint_result;
}
