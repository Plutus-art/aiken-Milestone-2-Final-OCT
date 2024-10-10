Here’s a markdown template you can use for your GitHub repository to document the "Development of New Features, Test Results, and Reports" for your **Aiken-lang Smart Contracts**:

```markdown
# Aiken-lang Smart Contracts: Development Features, Test Results & Reports

## 📖 Overview

This document highlights the **newly developed features**, **test results**, and **issue resolutions** for the Aiken-lang smart contracts utilized in our **NFT Marketplace on the Cardano blockchain**. Each section provides an in-depth explanation of the development process, encountered issues, solutions, and the outcomes.

## 🛠️ Developed Features

### 1. NFT Minting Functionality

The smart contract now supports **NFT minting** via Cardano's native token standards. The minting process includes metadata embedding, customizable token attributes, and a flexible fee mechanism.

**Code Snippet**:
```rust
// NFT Minting Function
fn mint_nft(asset_name: String, metadata: Map<String, String>, amount: i32) -> Result<Transaction, Error> {
    let nft = NFT {
        name: asset_name,
        metadata: metadata,
        quantity: amount,
        minted_by: caller(),
        minting_fee: calc_fee(amount),
    };
    Ok(Transaction::new(nft))
}
```

### 2. DEX Swap Integration

The marketplace integrates a **DEX swap functionality**, allowing users to exchange Cardano-based tokens and Plooty (PT) directly within the platform.

**Code Snippet**:
```rust
// Swap Functionality
fn swap_tokens(token_a: Token, token_b: Token, amount: i32) -> Result<Transaction, Error> {
    let rate = get_swap_rate(token_a, token_b);
    let swapped_amount = amount * rate;
    Ok(Transaction::new(token_b, swapped_amount))
}
```

### 3. NFT Studio

The contract powers a **NFT creation studio**, where users can create custom NFTs, select traits, and adjust parameters for minting.

**Code Snippet**:
```rust
// Create NFT in Studio
fn create_nft(attributes: Map<String, String>) -> NFT {
    NFT {
        name: attributes.get("name"),
        creator: caller(),
        traits: attributes,
        mint_time: get_block_time(),
    }
}
```

## 🔍 Test Results & Reports

We conducted a comprehensive series of unit and integration tests to validate the functionality of the newly added features.

### 1. Minting Feature Tests

- **Test Description**: Validate minting with correct metadata and fees.
- **Input**: Token name: `"NFTOne"`, Quantity: `1`, Metadata: `{"Artist": "Alice"}`, Mint Fee: `2 PT`
- **Expected Output**: NFT minted successfully with the correct token name, metadata, and fees.
- **Test Result**: ✅ Pass

**Test Snippet**:
```rust
#[test]
fn test_minting() {
    let result = mint_nft("NFTOne", {"Artist": "Alice"}, 1);
    assert_eq!(result.is_ok(), true);
    assert_eq!(result.unwrap().fee, 2);
}
```

### 2. DEX Swap Test

- **Test Description**: Verify swap functionality between Plooty (PT) and ADA.
- **Input**: Swap `10 PT` to ADA
- **Expected Output**: Swap successful with correct conversion rate.
- **Test Result**: ✅ Pass

**Test Snippet**:
```rust
#[test]
fn test_swap() {
    let result = swap_tokens(Plooty, ADA, 10);
    assert!(result.is_ok());
    assert_eq!(result.unwrap().amount, 50);  // Assuming a 5:1 rate
}
```

### 3. NFT Studio Test

- **Test Description**: Ensure NFT creation with specific traits works as intended.
- **Input**: Name: `"ArtNFT"`, Traits: `{"Color": "Red", "Rarity": "Rare"}`
- **Expected Output**: NFT created with the correct name and traits.
- **Test Result**: ✅ Pass

**Test Snippet**:
```rust
#[test]
fn test_create_nft() {
    let nft = create_nft({"name": "ArtNFT", "Color": "Red", "Rarity": "Rare"});
    assert_eq!(nft.name, "ArtNFT");
    assert_eq!(nft.traits.get("Rarity"), Some("Rare"));
}
```

## 🐛 Issues Encountered & Solutions

### Issue #1: **Gas Fee Calculation Error in Minting Process**

- **Description**: Minting NFT with large metadata resulted in miscalculated gas fees.
- **Cause**: Gas fee was not dynamically adjusting based on metadata size.
- **Solution**: Implemented a dynamic fee calculation based on metadata size.

**Solution Code**:
```rust
fn calc_fee(amount: i32) -> i32 {
    let base_fee = 2;
    let size_modifier = metadata_size * 0.01;
    base_fee + size_modifier as i32
}
```

### Issue #2: **Incorrect Token Swapping Rate**

- **Description**: The swap rate was fixed, leading to incorrect token conversions during fluctuating market conditions.
- **Cause**: Hardcoded swap rate.
- **Solution**: Integrated an oracle to fetch real-time rates for token swaps.

**Solution Code**:
```rust
fn get_swap_rate(token_a: Token, token_b: Token) -> i32 {
    let rate = oracle::fetch_rate(token_a, token_b);
    rate.unwrap_or(1) // Fallback to 1:1 if the rate is unavailable
}
```

## 📊 Test Coverage Report

| Feature       | Test Coverage | Status |
|---------------|----------------|--------|
| NFT Minting   | 98%            | ✅ Pass |
| DEX Swap      | 95%            | ✅ Pass |
| NFT Studio    | 97%            | ✅ Pass |
| Gas Fee Calc  | 92%            | ✅ Pass |

## 📑 Conclusion

The newly added features for NFT minting, token swapping, and the NFT studio have been rigorously tested and show robust functionality. Further improvements were made to ensure gas fee calculations and token swap rates align with market fluctuations.

The project will now move towards performance optimization and scalability testing.

For more details, check the full test logs in the `tests/` folder.
```

### Key Components:
1. **Overview**: Brief explanation of the content.
2. **Developed Features**: A summary and code snippets of newly added smart contract features.
3. **Test Results & Reports**: Test cases, inputs, outputs, and whether they passed or failed.
4. **Issues Encountered & Solutions**: Problems faced during development and how they were fixed, along with relevant code snippets.
5. **Test Coverage Report**: Summary table of test coverage.
6. **Conclusion**: Final thoughts and next steps.

Feel free to adjust the structure to your preferences!
