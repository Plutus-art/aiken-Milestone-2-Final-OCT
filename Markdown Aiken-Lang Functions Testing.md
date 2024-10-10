Here's a comprehensive GitHub markdown file with code snippets and explanations of both new and old functions, testing approaches, and general guidance for smart contract development in Aiken-lang.

---

# Aiken-lang Smart Contract Development: Functions & Testing

This repository contains smart contracts developed using **Aiken-lang** for the Cardano blockchain. Aiken-lang is designed to offer simplicity, strong typing, and performance. This documentation highlights the developed functions, including both the new additions and the previously implemented ones. It also explains how to test these contracts to ensure their correctness and security.

## Overview of Developed Functions

### 1. **Minting Function**
This function allows the minting of new tokens on the Cardano blockchain, adhering to certain conditions.

#### Code:
```aiken
-- Function to mint tokens
fn mint_tokens(owner: Address, amount: Int) -> Result {
    if amount > 0 then
        Result.Ok({owner, amount})
    else
        Result.Error("Amount must be greater than zero")
    end
}
```

#### Details:
- **Parameters**: 
  - `owner`: Address of the wallet minting the tokens.
  - `amount`: Number of tokens to be minted (must be a positive integer).
- **Returns**: `Result.Ok` with the `owner` and `amount` if successful, otherwise returns an `Error` with a message.
- **Testing Scenarios**: 
  - Test with valid `amount` > 0.
  - Test with invalid `amount` <= 0.

### 2. **Burning Function**
This function allows tokens to be destroyed, reducing the total supply.

#### Code:
```aiken
-- Function to burn tokens
fn burn_tokens(owner: Address, amount: Int) -> Result {
    if amount > 0 then
        Result.Ok({owner, amount})
    else
        Result.Error("Amount must be greater than zero")
    end
}
```

#### Details:
- **Parameters**: 
  - `owner`: Address of the wallet burning the tokens.
  - `amount`: Number of tokens to be burned (must be a positive integer).
- **Returns**: `Result.Ok` if the burn is successful, otherwise returns an error.
- **Testing Scenarios**:
  - Test with a valid `amount`.
  - Test with an invalid (negative or zero) `amount`.

### 3. **Transfer Function**
This function enables the transfer of tokens between two wallets.

#### Code:
```aiken
-- Function to transfer tokens between two addresses
fn transfer_tokens(sender: Address, receiver: Address, amount: Int) -> Result {
    if amount > 0 then
        -- Transfer logic here
        Result.Ok("Transfer successful")
    else
        Result.Error("Invalid transfer amount")
    end
}
```

#### Details:
- **Parameters**: 
  - `sender`: The address sending the tokens.
  - `receiver`: The address receiving the tokens.
  - `amount`: Number of tokens to be transferred.
- **Returns**: `Result.Ok` if the transfer succeeds, otherwise `Error` if the `amount` is invalid.
- **Testing Scenarios**:
  - Valid sender and receiver addresses with positive `amount`.
  - Invalid transfer with non-positive `amount`.

### 4. **Balance Checking Function**
This function checks the balance of a particular wallet.

#### Code:
```aiken
-- Function to check the balance of a given wallet
fn check_balance(owner: Address) -> Int {
    -- Retrieve balance for the owner address
    1000 -- Stub value for balance, replace with actual logic
}
```

#### Details:
- **Parameters**: 
  - `owner`: Address of the wallet.
- **Returns**: The current token balance of the wallet as an integer.
- **Testing Scenarios**:
  - Query balance for a valid `owner`.

### 5. **Rewards Distribution Function** (NEW)
This new function handles distributing rewards (such as loyalty points) to multiple users based on predefined criteria.

#### Code:
```aiken
-- Function to distribute rewards among multiple users
fn distribute_rewards(users: List(Address), reward_amount: Int) -> Result {
    if reward_amount > 0 then
        Result.Ok({users, reward_amount})
    else
        Result.Error("Invalid reward amount")
    end
}
```

#### Details:
- **Parameters**:
  - `users`: A list of addresses representing the recipients of rewards.
  - `reward_amount`: The total reward to be distributed among the users.
- **Returns**: `Result.Ok` if the distribution is valid, `Error` otherwise.
- **Testing Scenarios**:
  - Test with valid users and reward amount.
  - Test with zero or negative reward amount.

---

## Testing Framework

Aiken-lang provides a testing framework that can be used to write unit tests for your smart contracts. Here’s how to structure the tests for the above functions.

### 1. **Test Minting Tokens**

#### Code:
```aiken
-- Test minting tokens with a valid amount
test fn test_minting_valid_amount() -> Bool {
    let result = mint_tokens("owner_address", 100)
    result == Result.Ok({"owner_address", 100})
}

-- Test minting tokens with an invalid amount
test fn test_minting_invalid_amount() -> Bool {
    let result = mint_tokens("owner_address", 0)
    result == Result.Error("Amount must be greater than zero")
}
```

### 2. **Test Burning Tokens**

#### Code:
```aiken
-- Test burning tokens with a valid amount
test fn test_burning_valid_amount() -> Bool {
    let result = burn_tokens("owner_address", 50)
    result == Result.Ok({"owner_address", 50})
}

-- Test burning tokens with an invalid amount
test fn test_burning_invalid_amount() -> Bool {
    let result = burn_tokens("owner_address", -10)
    result == Result.Error("Amount must be greater than zero")
}
```

### 3. **Test Token Transfer**

#### Code:
```aiken
-- Test transfer of tokens between two valid addresses
test fn test_transfer_valid_amount() -> Bool {
    let result = transfer_tokens("sender_address", "receiver_address", 100)
    result == Result.Ok("Transfer successful")
}

-- Test transfer of tokens with an invalid amount
test fn test_transfer_invalid_amount() -> Bool {
    let result = transfer_tokens("sender_address", "receiver_address", 0)
    result == Result.Error("Invalid transfer amount")
}
```

### 4. **Test Reward Distribution** (NEW)

#### Code:
```aiken
-- Test reward distribution to multiple users
test fn test_distribute_valid_rewards() -> Bool {
    let users = ["user1_address", "user2_address"]
    let result = distribute_rewards(users, 200)
    result == Result.Ok({users, 200})
}

-- Test reward distribution with invalid amount
test fn test_distribute_invalid_rewards() -> Bool {
    let users = ["user1_address", "user2_address"]
    let result = distribute_rewards(users, 0)
    result == Result.Error("Invalid reward amount")
}
```

---

## Running the Tests

To run the tests in Aiken-lang, you can use the built-in test command:

```bash
aiken test
```

This command will execute all the tests defined in your project and provide feedback on the success or failure of each test case.

---

## Conclusion

By adhering to strong typing principles and comprehensive testing strategies in Aiken-lang, your smart contracts will be more robust and less prone to errors. This documentation provides both code snippets and explanations to help you understand the functionality of the developed contracts and how to test them effectively.

Feel free to explore the code and contribute!

---

Feel free to adjust or extend this to suit your specific project details!
