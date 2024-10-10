Here’s a description of **Access Control** in Aiken-lang with relevant code snippets:

---

# Access Control in Aiken-lang

Access control in **Aiken-lang** refers to the mechanisms that restrict or permit users or entities to perform certain actions within smart contracts. Implementing proper access control is crucial for security in decentralized applications (dApps) running on the Cardano blockchain.

Aiken-lang provides ways to define specific rules and conditions that determine who can execute certain functions or interact with specific parts of a smart contract. Access control ensures that only authorized entities, such as the contract owner or designated roles, can perform sensitive operations like minting tokens or transferring funds.

## Common Access Control Patterns in Aiken-lang

1. **Owner-based Access Control**  
   Restricts certain functions so that only the contract creator (or owner) can execute them.

2. **Role-based Access Control**  
   Restricts access based on roles assigned to users, such as admin, operator, or minter.

3. **Conditional Access Control**  
   Allows access only when specific conditions are met, such as balance thresholds or time-based restrictions.

---

### 1. **Owner-based Access Control**

In this pattern, only the owner of the contract is allowed to execute specific functions.

```aiken
type Owner = Address

-- Define contract state with an owner
type ContractState = {
    owner: Owner
}

-- Function that only the owner can call
fn only_owner(state: ContractState, caller: Address) -> Result {
    if caller == state.owner then
        Result.Ok("Access granted: You are the owner")
    else
        Result.Error("Access denied: Only the owner can perform this action")
    end
}
```

- **Explanation:**  
  In this example, the `only_owner` function checks if the `caller` is the same as the contract's `owner`. If the caller matches, the action proceeds; otherwise, access is denied.

---

### 2. **Role-based Access Control**

In role-based access control, users are assigned specific roles like `admin`, `minter`, or `operator`, and access to certain functions depends on the role of the caller.

```aiken
type Role = 
  | Admin
  | Minter
  | User

-- Map addresses to roles
type ContractState = {
    roles: Map(Address, Role)
}

-- Check if the caller has the required role
fn has_role(state: ContractState, caller: Address, required_role: Role) -> Result {
    match state.roles.get(caller) {
        Some(role) => 
            if role == required_role then
                Result.Ok("Access granted")
            else
                Result.Error("Access denied: Insufficient role privileges")
        None => 
            Result.Error("Access denied: No role assigned")
    }
}
```

- **Explanation:**  
  The `has_role` function checks if the caller has the required role by looking up their assigned role in a `Map`. If the caller's role matches the required role (e.g., `Admin` or `Minter`), the function allows access; otherwise, it denies access.

---

### 3. **Conditional Access Control**

Sometimes, access to certain functions depends on specific conditions, such as a user’s balance, the current time, or the number of tokens held.

```aiken
type ContractState = {
    token_balance: Map(Address, Int),
    release_time: Time
}

-- Function that can only be executed if the caller holds enough tokens
fn minimum_balance_required(state: ContractState, caller: Address, min_balance: Int) -> Result {
    match state.token_balance.get(caller) {
        Some(balance) => 
            if balance >= min_balance then
                Result.Ok("Access granted: Balance requirement met")
            else
                Result.Error("Access denied: Insufficient balance")
        None => 
            Result.Error("Access denied: Caller has no balance")
    }
}

-- Time-based access control function
fn time_locked_access(state: ContractState, current_time: Time) -> Result {
    if current_time >= state.release_time then
        Result.Ok("Access granted: Time lock has expired")
    else
        Result.Error("Access denied: Time lock still in effect")
    end
}
```

- **Explanation:**  
  The `minimum_balance_required` function ensures that the caller has a minimum balance to access certain features. The `time_locked_access` function checks whether the current time has passed a predefined release time, allowing actions only after that moment.

---

## Example: Combining Owner and Role-based Access

You can combine owner-based and role-based access control in a single contract for more fine-grained control.

```aiken
type Role = 
  | Admin
  | Minter
  | User

type ContractState = {
    owner: Address,
    roles: Map(Address, Role)
}

-- Only the owner or an admin can mint new tokens
fn mint_tokens(state: ContractState, caller: Address) -> Result {
    if caller == state.owner || has_role(state, caller, Admin) == Result.Ok("Access granted") then
        Result.Ok("Minting tokens...")
    else
        Result.Error("Access denied: Only owner or admin can mint tokens")
    end
}

fn has_role(state: ContractState, caller: Address, required_role: Role) -> Result {
    match state.roles.get(caller) {
        Some(role) => 
            if role == required_role then
                Result.Ok("Access granted")
            else
                Result.Error("Access denied: Insufficient role privileges")
        None => 
            Result.Error("Access denied: No role assigned")
    }
}
```

- **Explanation:**  
  In this example, the `mint_tokens` function allows only the owner or a user with the `Admin` role to mint new tokens. The function checks both ownership and role assignment to determine access.

---

## Conclusion

Access control in Aiken-lang is essential for ensuring that only authorized users can execute specific actions in smart contracts. By using owner-based, role-based, or conditional access patterns, you can secure your contract and prevent unauthorized access. Aiken-lang’s strong typing and pattern-matching features make it easy to implement these access control mechanisms in a reliable and secure way.

--- 

You can adapt this document to your specific project needs or expand on it to include more advanced access control strategies.
