test "mint_nft with valid inputs" {
    // Arrange
    let valid_owner = addr("addr_test1...")
    let token_name = "UniqueNFT"
    
    // Act
    let minted_nft = mint_nft(valid_owner, token_name)
    
    // Assert
    assert_eq(minted_nft.owner, valid_owner)
    assert_eq(minted_nft.token_name, token_name)
}
