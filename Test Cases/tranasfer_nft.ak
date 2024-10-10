test "mint_nft with invalid owner address" {
    // Arrange
    let invalid_owner = addr("invalid_addr")
    
    // Act & Assert
    assert_throws(mint_nft(invalid_owner, "MyNFT"), InvalidOwnerError)
}
