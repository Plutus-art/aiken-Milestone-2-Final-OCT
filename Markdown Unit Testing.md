## 📝 GitHub Documentation in Markdown

```markdown
# Unit Testing for Aiken-Lang Smart Contracts

## Introduction
This document describes the unit testing process for the Aiken-lang smart contracts developed for the NFT marketplace. The purpose of these tests is to ensure that individual components (e.g., NFT minting, transfer, and auction features) function correctly in isolation.

## Unit Test Cases

### Test Case #1: NFT Minting
- **Objective**: Verify the `mint_nft` function works correctly.
- **Steps**:
  1. Mint an NFT with a valid owner address and token name.
  2. Validate that the NFT is correctly assigned to the owner and that the minting is successful.
  
- **Expected Result**: The NFT is minted with the correct token name and owner.

```aiken
test "mint_nft function mints NFT with valid owner" {
    let owner = addr("addr_test1...")
    let token_name = "MyUniqueNFT"
    let minted_nft = mint_nft(owner, token_name)

    assert_eq(minted_nft.owner, owner)
    assert_eq(minted_nft.token_name, token_name)
    assert_eq(minted_nft.is_minted, true)
}
```

---

### Test Case #2: NFT Transfer
- **Objective**: Verify that NFTs can be successfully transferred from one owner to another.
- **Steps**:
  1. Mint an NFT for Owner A.
  2. Transfer the NFT from Owner A to Owner B.
  3. Validate that Owner B now owns the NFT.
  
- **Expected Result**: The NFT's ownership is successfully transferred to Owner B.

```aiken
test "transfer_nft transfers NFT from owner A to owner B" {
    let owner_a = addr("addr_test1...")
    let owner_b = addr("addr_test2...")
    let nft = mint_nft(owner_a, "MyNFT")

    transfer_nft(owner_a, owner_b, nft)

    assert_eq(nft.owner, owner_b)
}
```

---

### Test Case #3: Auction Listing
- **Objective**: Ensure the `list_nft_for_auction` function correctly lists an NFT for auction.
- **Steps**:
  1. Mint an NFT.
  2. List the NFT for auction.
  3. Validate that the auction is active and the NFT is listed.
  
- **Expected Result**: The NFT is successfully listed for auction with an active status.

```aiken
test "list_nft_for_auction creates auction listing" {
    let owner = addr("addr_test1...")
    let nft = mint_nft(owner, "AuctionNFT")

    let auction_listing = list_nft_for_auction(nft, owner)

    assert_eq(auction_listing.nft, nft)
    assert_eq(auction_listing.owner, owner)
    assert_eq(auction_listing.is_active, true)
}
```

---

## Running the Tests
To execute the unit tests, run the following command:

```bash
aiken test
```

---

## Conclusion
These unit tests verify the correct functionality of key features like minting, transferring, and auctioning NFTs. Running these tests ensures that the individual components of the smart contracts behave as expected.
```

---

By following this structure, you can both verify the isolated functionality of your Aiken-lang smart contract components and document the process clearly for GitHub. Each test case includes its own code snippet for easy replication and validation.
