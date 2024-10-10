func calculate_fee(user: User, transaction_amount: Amount) {
    let base_fee = get_base_fee();
    let discount = get_discount(user);
    return base_fee - discount;
}
