Here’s a suggested markdown structure for your GitHub repository, incorporating the code snippets and explanations above:

```markdown
# NFT Marketplace Smart Contracts with Aiken

This repository contains smart contracts for an NFT marketplace built on the Cardano blockchain using the **Aiken** language. The marketplace allows users to mint, list, and purchase NFTs, with additional functionality for rewarding buyers using the native token **Plooty (PT)**.

## Features

- **Minting NFTs**: Users can mint unique NFTs and assign them metadata.
- **Listing NFTs**: NFTs can be listed for sale with specified prices.
- **Buying NFTs**: Buyers can purchase listed NFTs by transferring the required amount of ADA.
- **Rewards System**: Buyers are rewarded with **Plooty (PT)** tokens for completing purchases.

## Smart Contract Code

### NFT Marketplace Contract

```aiken
contract NFTMarketplace {

  // Defining custom data types for minting and marketplace interaction
  data NFT = {
    id: Int,
    creator: Address,
    metadata: ByteArray
  }

  data Listing = {
    nftId: Int,
    seller: Address,
    price: Value,
    isActive: Bool
  }

  // Function: Minting an NFT
  pub fun mintNFT(creator: Address, metadata: ByteArray): NFT {
    let nftId = getNextNFTId();
    NFT { id: nftId, creator: creator, metadata: metadata }
  }

  // Function: List an NFT for sale
  pub fun listNFT(nft: NFT, seller: Address, price: Value): Listing {
    Listing { nftId: nft.id, seller: seller, price: price, isActive: True }
  }

  // Function: Buy an NFT
  pub fun buyNFT(listing: Listing, buyer: Address, payment: Value) -> Result<NFT, String> {
    if listing.isActive && payment == listing.price {
      Result.Ok(NFT { id: listing.nftId, creator: buyer, metadata: getNFTMetadata(listing.nftId) })
    } else {
      Result.Err("NFT is not available for sale or payment mismatch")
    }
  }

  // Helper function: Retrieve NFT metadata
  fun getNFTMetadata(nftId: Int) -> ByteArray {
    // Logic to retrieve NFT metadata from storage
  }

  // Helper function: Generate next NFT id
  fun getNextNFTId() -> Int {
    // Logic to fetch or increment next NFT ID
  }
}
```

### NFT Marketplace With Rewards

This expanded version of the marketplace contract adds a reward system where buyers are rewarded with **Plooty (PT)** tokens upon completing a purchase.

```aiken
contract NFTMarketplaceWithRewards {
  data Reward = {
    buyer: Address,
    amount: Value
  }

  // Function: Buy NFT and reward buyer with Plooty (PT)
  pub fun buyNFTWithRewards(listing: Listing, buyer: Address, payment: Value) -> Result<(NFT, Reward), String> {
    if listing.isActive && payment == listing.price {
      let nft = NFTMarketplace.buyNFT(listing, buyer, payment).unwrap();
      let reward = Reward { buyer: buyer, amount: Value.new("PT", 1000) }; // Reward 1000 PT tokens
      
      Result.Ok((nft, reward))
    } else {
      Result.Err("NFT is not available for sale or payment mismatch")
    }
  }
}
```

## Test Cases

The following test cases ensure that the marketplace contract's functionalities work as expected.

### Test case 1: Minting an NFT

```aiken
test fun testMintNFT() {
  let creator = Address.new("addr_test1...");
  let metadata = ByteArray.new("metadata of NFT");
  
  let mintedNFT = NFTMarketplace.mintNFT(creator, metadata);
  
  assert_eq(mintedNFT.creator, creator);
  assert_eq(mintedNFT.metadata, metadata);
}
```

### Test case 2: Listing an NFT for Sale

```aiken
test fun testListNFT() {
  let seller = Address.new("addr_test1...");
  let price = Value.lovelace(1000000); // 1 ADA in lovelace

  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("metadata of NFT"));
  let listing = NFTMarketplace.listNFT(nft, seller, price);

  assert_eq(listing.seller, seller);
  assert_eq(listing.price, price);
  assert(listing.isActive);
}
```

### Test case 3: Buying an NFT

```aiken
test fun testBuyNFT() {
  let seller = Address.new("addr_test1...");
  let buyer = Address.new("addr_test2...");
  let price = Value.lovelace(1000000);

  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("metadata of NFT"));
  let listing = NFTMarketplace.listNFT(nft, seller, price);

  // Simulate buyer sending correct amount of ADA
  let payment = Value.lovelace(1000000);
  let result = NFTMarketplace.buyNFT(listing, buyer, payment);

  assert(is_ok(result));
  match result {
    Ok(nft) => assert_eq(nft.creator, buyer),
    Err(_) => assert(False, "Failed to buy NFT")
  }
}
```

### Test case 4: Buying an NFT and Receiving Rewards

```aiken
test fun testBuyNFTWithRewards() {
  let seller = Address.new("addr_test1...");
  let buyer = Address.new("addr_test2...");
  let price = Value.lovelace(1000000);

  let nft = NFTMarketplace.mintNFT(seller, ByteArray.new("metadata of NFT"));
  let listing = NFTMarketplace.listNFT(nft, seller, price);

  let payment = Value.lovelace(1000000);
  let result = NFTMarketplaceWithRewards.buyNFTWithRewards(listing, buyer, payment);

  assert(is_ok(result));
  match result {
    Ok((nft, reward)) => {
      assert_eq(nft.creator, buyer);
      assert_eq(reward.amount, Value.new("PT", 1000)); // Reward amount should be 1000 PT
    },
    Err(_) => assert(False, "Failed to buy NFT with rewards")
  }
}
```

## Getting Started

To run the smart contracts and test cases:

1. Install Aiken by following the official documentation [here](https://aiken-lang.org).
2. Clone this repository:
    ```sh
    git clone https://github.com/yourusername/nft-marketplace-aiken.git
    cd nft-marketplace-aiken
    ```
3. Run the test cases:
    ```sh
    aiken test
    ```

## Contributing

Feel free to fork this repository, submit issues, or create pull requests to improve the functionality and features of the marketplace.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```

### Explanation:
- The **Features** section highlights the main functionality of your NFT marketplace.
- The **Smart Contract Code** section provides the core logic for minting, listing, buying, and the reward system.
- The **Test Cases** section demonstrates how to write tests for each feature.
- The **Getting Started** section gives instructions for running the contracts and tests.
- The **Contributing** and **License** sections encourage contributions and clarify licensing.

Feel free to adapt the above markdown for your GitHub project!