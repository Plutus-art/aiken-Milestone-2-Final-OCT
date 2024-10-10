xfunc mint_nft(nft_id: NFTID, owner: Address) -> Bool {
    let gas_start = get_gas_used();       -- Capture starting gas
    let new_nft = create_nft(nft_id, owner);
    let gas_end = get_gas_used();         -- Capture ending gas
    log_gas_usage(gas_end - gas_start);   -- Log or return gas usage
    new_nft != null
}
