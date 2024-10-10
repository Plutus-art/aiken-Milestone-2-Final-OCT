test "transfer_nft transfers NFT from owner A to owner B" {
    // Arrange
    let owner_a = addr("addr_test1...")
    let owner_b = addr("addr_test2...")
    let nft = mint_nft(owner_a, "MyNFT")

    // Act
    transfer_nft(owner_a, owner_b, nft)

    // Assert
    assert_eq(nft.owner, owner_b)
}
