test "mint_nft function mints NFT with valid owner" {
    // Arrange
    let owner = addr("addr_test1...")
    let token_name = "MyUniqueNFT"

    // Act
    let minted_nft = mint_nft(owner, token_name)

    // Assert
    assert_eq(minted_nft.owner, owner)
    assert_eq(minted_nft.token_name, token_name)
    assert_eq(minted_nft.is_minted, true)
}
