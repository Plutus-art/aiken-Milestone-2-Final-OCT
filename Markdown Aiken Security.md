Here's a GitHub markdown document that discusses **Advanced Security** in Aiken-lang smart contracts, focusing on best practices and providing advanced-level code snippets.

```markdown
# Advanced Security in Aiken-Lang Smart Contracts

Security is paramount when developing smart contracts for decentralized applications. Aiken-lang provides various tools and features to help developers write secure contracts for the Cardano blockchain. This document covers advanced security practices, including how to avoid common vulnerabilities and implement secure coding patterns.

## 1. Secure Input Validation

One of the most important aspects of security is ensuring that all inputs are validated properly to avoid malicious data being processed by the contract.

### Example: Input Length Validation

In some cases, attackers may attempt to exploit your contract by providing excessively long or short inputs. Input validation ensures that only the expected range of values is accepted.

```aiken
// Function to validate input length
fn validate_input_length(input: string, minLen: int, maxLen: int) -> Result<void, string> {
    let length = length(input)
    
    if length >= minLen && length <= maxLen {
        Ok(())
    } else {
        Err("Invalid input length")
    }
}

// Example usage within a contract function
fn create_nft(name: string, metadata: Metadata) -> Result<NFT, string> {
    match validate_input_length(name, 3, 50) {
        Ok(()) -> {
            // Create the NFT
            let nft = NFT {
                asset_name: name,
                metadata: metadata
            }
            Ok(nft)
        }
        Err(err) -> Err(err)
    }
}
```

### Advanced Input Validation with Regular Expressions

For even more advanced validation, you can use regular expressions to ensure inputs conform to specific patterns (e.g., validating addresses or specific metadata formats).

```aiken
use aiken/Regex

// Define a regex pattern to validate Cardano addresses
let addressPattern = Regex.compile("^addr1[0-9a-zA-Z]{58}$")

fn validate_address_format(address: string) -> Result<void, string> {
    if Regex.match(address, addressPattern) {
        Ok(())
    } else {
        Err("Invalid Cardano address format")
    }
}

// Example usage
fn transfer_token(recipient: string, amount: int) -> Result<void, string> {
    match validate_address_format(recipient) {
        Ok(()) -> {
            // Proceed with token transfer
            transfer(recipient, amount)
            Ok(())
        }
        Err(err) -> Err(err)
    }
}
```

---

## 2. Preventing Reentrancy Attacks

Reentrancy attacks occur when a malicious contract calls back into the vulnerable contract, possibly exploiting inconsistent state. To prevent this, it is crucial to update contract states before transferring funds or calling external contracts.

### Example: Reentrancy Guard

```aiken
// Define a simple state to track if the contract is currently being accessed
let isLocked: bool = false

fn lock_contract() -> Result<void, string> {
    if isLocked {
        Err("Reentrancy detected")
    } else {
        isLocked = true
        Ok(())
    }
}

fn unlock_contract() -> void {
    isLocked = false
}

// Secure function with reentrancy guard
fn withdraw_funds(user: Address, amount: int) -> Result<void, string> {
    match lock_contract() {
        Ok(()) -> {
            // Proceed with fund withdrawal
            let success = transfer_funds(user, amount)
            unlock_contract()

            if success {
                Ok(())
            } else {
                Err("Withdrawal failed")
            }
        }
        Err(err) -> Err(err)
    }
}
```

In the example above, the `lock_contract()` function ensures that no reentrant calls can take place. If the contract is already locked, it throws an error to prevent reentrancy.

---

## 3. Access Control Mechanisms

Implementing proper access control ensures that only authorized users can interact with specific contract functions. Using role-based access control (RBAC), as demonstrated in previous sections, is a good practice, but there are more advanced techniques for sensitive operations.

### Example: Time-Based Access Control (TBAC)

In some cases, access to certain contract functions should only be allowed during a specific time window.

```aiken
use aiken/Time

// Define an access window (e.g., a presale for an NFT)
let saleStartTime: Time = Time.from_unix_timestamp(1700000000)
let saleEndTime: Time = Time.from_unix_timestamp(1705000000)

// Time-based access control function
fn is_within_time_window() -> Result<void, string> {
    let currentTime = Time.now()
    
    if currentTime >= saleStartTime && currentTime <= saleEndTime {
        Ok(())
    } else {
        Err("Unauthorized: Outside of allowed time window")
    }
}

// Example usage: NFT presale function
fn purchase_presale_nft(user: Address) -> Result<void, string> {
    match is_within_time_window() {
        Ok(()) -> {
            // Proceed with the purchase
            mint_nft(user)
            Ok(())
        }
        Err(err) -> Err(err)
    }
}
```

The above example restricts access to a contract function based on a time window. This is useful for time-sensitive operations like presales, auctions, or voting.

---

## 4. Safe Arithmetic Operations

Overflow and underflow errors are a common vulnerability in smart contracts. To prevent these errors, it is essential to use safe arithmetic functions that handle such scenarios gracefully.

### Example: Safe Arithmetic for Token Transfers

```aiken
// Safe addition function to prevent overflow
fn safe_add(x: int, y: int) -> Result<int, string> {
    let result = x + y
    if result >= x {
        Ok(result)
    } else {
        Err("Overflow detected")
    }
}

// Safe subtraction function to prevent underflow
fn safe_subtract(x: int, y: int) -> Result<int, string> {
    if x >= y {
        Ok(x - y)
    } else {
        Err("Underflow detected")
    }
}

// Example usage in token transfer logic
fn transfer_tokens(sender: Address, receiver: Address, amount: int) -> Result<void, string> {
    match safe_subtract(get_balance(sender), amount) {
        Ok(newSenderBalance) -> {
            match safe_add(get_balance(receiver), amount) {
                Ok(newReceiverBalance) -> {
                    set_balance(sender, newSenderBalance)
                    set_balance(receiver, newReceiverBalance)
                    Ok(())
                }
                Err(err) -> Err(err)
            }
        }
        Err(err) -> Err(err)
    }
}
```

The above functions ensure that arithmetic operations like addition and subtraction are safe from overflow and underflow attacks, preventing potential contract vulnerabilities.

---

## 5. Secure Storage Access

Sensitive data stored in smart contracts should be accessed securely to prevent unauthorized reads or writes. When designing your contract, ensure that only the appropriate users or roles can modify the state.

### Example: Role-Based Secure Storage Access

```aiken
// Define a storage access control function for sensitive operations
fn authorize_storage_access(user: Address, requiredRole: Role) -> Result<void, string> {
    match authorize(user, requiredRole) {
        Ok(()) -> Ok(())
        Err(err) -> Err("Unauthorized storage access")
    }
}

// Secure function to update marketplace data
fn update_marketplace_data(admin: Address, newFee: int) -> Result<void, string> {
    match authorize_storage_access(admin, Admin) {
        Ok(()) -> {
            // Proceed with updating marketplace fee
            set_marketplace_fee(newFee)
            Ok(())
        }
        Err(err) -> Err(err)
    }
}
```

In this example, only users with the `Admin` role can modify critical marketplace data. Unauthorized attempts are blocked by the `authorize_storage_access()` function.

---

## 6. Event Logging for Auditing

Logging critical events within your smart contract allows for post-execution auditing, which is crucial for tracking unusual or suspicious behavior. Aiken-lang supports event logging to record important contract actions.

### Example: Logging Events for Auditing

```aiken
// Log an event when an NFT is minted
fn mint_nft(user: Address) -> Result<NFT, string> {
    let nft = NFT {
        asset_name: "Artwork",
        metadata: Metadata {
            creator: "Artist Name",
            description: "Unique digital artwork"
        }
    }

    // Mint the NFT
    mint(user, nft)

    // Log the minting event
    log_event("NFT Minted", {
        user: user,
        asset_name: nft.asset_name,
        timestamp: Time.now()
    })

    Ok(nft)
}

// Example of a basic event logger
fn log_event(eventType: string, details: Map<string, string>) -> void {
    // Store event in contract's log (simplified for the example)
    add_to_log({
        event_type: eventType,
        details: details
    })
}
```

Event logging is particularly useful for auditing operations like token minting, fund transfers, and role changes.

---

## Conclusion

Implementing security in Aiken-lang smart contracts requires careful attention to detail. By following these advanced practices, including input validation, reentrancy guards, role-based access control, safe arithmetic, secure storage access, and event logging, you can significantly reduce the risk of vulnerabilities in your smart contracts.

Always test your contracts thoroughly and consider employing external audits to ensure that your contract is secure before deployment.

---
```

This markdown document provides advanced security practices for Aiken-lang smart contracts, with code snippets for secure input validation, preventing reentrancy attacks, time-based access control, safe arithmetic, secure storage access, and event logging.
