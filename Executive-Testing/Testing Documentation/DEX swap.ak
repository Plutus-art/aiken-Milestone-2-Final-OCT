-- Test for DEX token swapping
xfunc dex_swap_test() -> Bool {
    let token_in = Token("token_a");
    let amount_in = Amount(100);
    let token_out = Token("token_b");

    let swap_result = dex_swap(token_in, amount_in, token_out);
    
    -- Assert that the swap was successful
    assert(swap_result == True, "DEX swap failed.");
    
    return swap_result;
}
