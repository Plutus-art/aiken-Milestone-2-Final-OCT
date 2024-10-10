 test "mint and transfer NFT between two wallets" {
    // Arrange
    let owner_a = addr("addr_test1...")
    let owner_b = addr("addr_test2...")
    
    // Act: Mint the NFT for Owner A
    let nft = mint_nft(owner_a, "MintedNFT")

    // Assert: Check that Owner A owns the NFT
    assert_eq(nft.owner, owner_a)

    // Act: Transfer the NFT to Owner B
    transfer_nft(owner_a, owner_b, nft)

    // Assert: Check that Owner B now owns the NFT
    assert_eq(nft.owner, owner_b)
}