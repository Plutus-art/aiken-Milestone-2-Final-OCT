-- Test for basic token transfer
xfunc token_transfer_test() -> Bool {
    let sender = Address.from_bech32("addr_test1...");
    let recipient = Address.from_bech32("addr_test1...");
    let amount = Amount(500);

    let transfer_result = transfer_tokens(sender, recipient, amount);
    
    -- Assert that the token transfer was successful
    assert(transfer_result == True, "Token transfer failed.");
    
    return transfer_result;
}
