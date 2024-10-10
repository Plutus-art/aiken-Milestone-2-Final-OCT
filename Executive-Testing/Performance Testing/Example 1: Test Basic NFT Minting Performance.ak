xfunc mint_nft(nft_id: NFTID, owner: Address) -> Bool {
    -- Simulate minting logic here
    let new_nft = create_nft(nft_id, owner);
    -- Return whether the minting was successful
    new_nft != null
}
