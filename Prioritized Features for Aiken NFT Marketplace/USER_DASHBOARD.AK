func get_user_dashboard(user: User) -> Dashboard {
    let owned_nfts = get_owned_nfts(user);
    let active_listings = get_active_listings(user);
    return Dashboard(owned_nfts, active_listings);
}
