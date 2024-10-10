xfunc dex_swap(token_in: Token, amount_in: Amount, token_out: Token) -> Bool {
    let swapped_amount = calculate_swap(token_in, amount_in, token_out);
    -- Simulate swap transaction success
    swapped_amount > 0
}
