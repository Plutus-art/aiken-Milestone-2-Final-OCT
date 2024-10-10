Here's a markdown template you can use for your GitHub documentation to showcase the test results, reports, and issues encountered during the development of Aiken-lang smart contract functions. This example assumes you have implemented some basic functionalities, but feel free to adjust it according to the exact functions you've developed and tested.

---

# Aiken-Lang Smart Contracts - Test Results and Reports

## Overview

This document outlines the testing results and reports for the smart contract functions developed using [Aiken-lang](https://aiken-lang.org/) on the Cardano blockchain. These functions were designed for use in an advanced NFT marketplace that includes features such as minting, NFT creation studio, DEX swap, and a rewards system through a native token called `Plooty (PT)`.

### Summary of Key Functions
1. **Minting Function** - Used to mint new NFTs.
2. **Transfer Function** - Transfers NFTs or tokens between users.
3. **Swap Function (DEX)** - Allows users to swap tokens or NFTs directly.
4. **Rewards Distribution** - Manages and distributes rewards in the form of `Plooty (PT)` tokens.

---

## Test Results

### 1. Minting Function

**Test Case**: Minting new NFTs with specific metadata.

```aiken
fn mint_nft(owner: Address, metadata: Map<String, String>) -> TxOut {
    // Business logic for minting an NFT with unique metadata
    if owner.is_valid() {
        let token = Token {
            policy_id: PolicyID::new(),
            token_name: "NFT_" + metadata["name"],
            amount: 1
        }
        TxOut { owner, value: Value::from(token) }
    } else {
        TxOut::error("Invalid owner address")
    }
}
```

**Expected Behavior**: 
- NFT should be minted and assigned to the provided owner address.
- Proper error handling for invalid owner addresses or missing metadata.

**Test Results**: 
- ✅ **Pass**: NFT minted successfully with correct metadata and ownership.
- ⚠️ **Edge Case**: Failed when metadata contained special characters.

**Issue Identified**:
- Special characters in metadata keys cause serialization issues during minting.

**Solution**:
- Added input sanitization to strip or encode special characters before storing metadata.

---

### 2. Transfer Function

**Test Case**: Transfer of NFT from one address to another.

```aiken
fn transfer_nft(sender: Address, recipient: Address, token: Token) -> TxOut {
    if sender.has_token(token) {
        let sender_out = TxOut { sender, value: Value::empty() }
        let recipient_out = TxOut { recipient, value: Value::from(token) }
        (sender_out, recipient_out)
    } else {
        TxOut::error("Sender does not own this token")
    }
}
```

**Expected Behavior**:
- NFT should be transferred from `sender` to `recipient` correctly.
- Proper validation for token ownership.

**Test Results**: 
- ✅ **Pass**: Tokens transferred successfully when valid ownership is confirmed.
- ❌ **Fail**: Failed when checking for ownership of multi-asset tokens.

**Issue Identified**:
- Ownership check logic is not compatible with multi-asset tokens.

**Solution**:
- Refactored ownership validation to support multi-asset tokens by iterating over the token bundle.

---

### 3. Swap Function (DEX)

**Test Case**: Swapping one token/NFT for another between users.

```aiken
fn swap_tokens(sender: Address, recipient: Address, token_offered: Token, token_requested: Token) -> Tx {
    if sender.has_token(token_offered) && recipient.has_token(token_requested) {
        let sender_out = TxOut { sender, value: Value::from(token_requested) }
        let recipient_out = TxOut { recipient, value: Value::from(token_offered) }
        Tx { inputs: [sender, recipient], outputs: [sender_out, recipient_out] }
    } else {
        Tx::error("One or both users do not own the required tokens")
    }
}
```

**Expected Behavior**:
- Swaps should be completed successfully when both users have the required tokens.

**Test Results**: 
- ✅ **Pass**: Successful token swap under normal conditions.
- ❌ **Fail**: Failed when using locked tokens or tokens under staking.

**Issue Identified**:
- Swap logic doesn’t account for tokens locked in staking pools or smart contracts.

**Solution**:
- Implemented additional checks for token state (locked, staked, etc.) before allowing swaps.

---

### 4. Rewards Distribution

**Test Case**: Distribute `Plooty (PT)` tokens to users based on activity.

```aiken
fn distribute_rewards(users: List<Address>, amounts: List<Value>) -> List<TxOut> {
    if users.length == amounts.length {
        List.zip_with(users, amounts, |user, amount| TxOut { user, value: amount })
    } else {
        List.empty()
    }
}
```

**Expected Behavior**:
- Each user should receive the correct amount of rewards based on the distribution list.

**Test Results**: 
- ✅ **Pass**: Rewards distributed accurately when input data is valid.
- ⚠️ **Edge Case**: Failed when user list or amounts list is empty.

**Issue Identified**:
- Missing validation for empty user or amount lists, which causes mismatches.

**Solution**:
- Added validation to ensure that the lists are non-empty and of the same length before processing.

---

## Report Summary

During the testing phase, the following major issues were encountered and addressed:

1. **Metadata Serialization**: Special characters in NFT metadata caused issues during serialization in the minting function. This was resolved by sanitizing the input.
2. **Multi-Asset Ownership**: The ownership validation logic was not compatible with multi-asset tokens. The solution was to iterate over all assets in the token bundle.
3. **Locked Token Handling**: Swaps failed when tokens were locked in staking pools or other contracts. Added checks for token state before allowing swaps.
4. **Edge Cases in Rewards**: Issues with empty user/amount lists were handled by adding proper validation.

All issues have been resolved, and the final tests have passed successfully.

---

### Future Improvements
- Enhance input validation for all smart contract functions.
- Implement gas optimizations to reduce transaction costs.
- Expand testing to include stress tests with large datasets for rewards distribution.

---

## How to Run Tests

To run the test suite for the Aiken-lang smart contracts, follow these steps:

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/your-repo/aiken-nft-marketplace.git
    cd aiken-nft-marketplace
    ```

2. **Install Dependencies**:
    Make sure you have the Aiken compiler installed. Instructions are available on the [Aiken website](https://aiken-lang.org/docs/installation).

3. **Run Tests**:
    ```bash
    aiken test
    ```

4. **View Results**:
    Test results will be displayed in the terminal. For detailed logs, check the `test/logs` directory.

---

Feel free to reach out if you have any questions or issues!

