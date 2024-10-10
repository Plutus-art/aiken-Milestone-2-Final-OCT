Here's a GitHub markdown document listing key functions available in Aiken-lang for smart contract development. This includes examples with code snippets for each function:

---

# List of Available Functions in Aiken-lang for Smart Contract Development

Aiken-lang provides a range of built-in functions that simplify smart contract development on the Cardano blockchain. This document serves as a reference guide to the commonly used functions in Aiken, complete with examples for each.

## 1. Arithmetic Functions

### `add`
Performs addition of two integers.

```aiken
let result = add(5, 10)
-- result will be 15
```

### `subtract`
Subtracts the second integer from the first.

```aiken
let result = subtract(10, 5)
-- result will be 5
```

### `multiply`
Multiplies two integers.

```aiken
let result = multiply(5, 10)
-- result will be 50
```

### `divide`
Divides the first integer by the second.

```aiken
let result = divide(10, 2)
-- result will be 5
```

### `modulo`
Finds the remainder when dividing the first integer by the second.

```aiken
let result = modulo(10, 3)
-- result will be 1
```

## 2. Comparison Functions

### `greater_than`
Checks if the first number is greater than the second.

```aiken
let result = greater_than(10, 5)
-- result will be true
```

### `less_than`
Checks if the first number is less than the second.

```aiken
let result = less_than(5, 10)
-- result will be true
```

### `equal`
Checks if two values are equal.

```aiken
let result = equal(10, 10)
-- result will be true
```

### `not_equal`
Checks if two values are not equal.

```aiken
let result = not_equal(10, 5)
-- result will be true
```

## 3. Logical Functions

### `and`
Logical AND between two Boolean values.

```aiken
let result = and(true, false)
-- result will be false
```

### `or`
Logical OR between two Boolean values.

```aiken
let result = or(true, false)
-- result will be true
```

### `not`
Logical NOT on a Boolean value.

```aiken
let result = not(true)
-- result will be false
```

## 4. String Functions

### `concat`
Concatenates two strings.

```aiken
let result = concat("Hello, ", "world!")
-- result will be "Hello, world!"
```

### `length`
Returns the length of a string.

```aiken
let result = length("Hello")
-- result will be 5
```

### `to_uppercase`
Converts a string to uppercase.

```aiken
let result = to_uppercase("aiken")
-- result will be "AIKEN"
```

### `to_lowercase`
Converts a string to lowercase.

```aiken
let result = to_lowercase("AIKEN")
-- result will be "aiken"
```

## 5. List Functions

### `list_length`
Returns the number of elements in a list.

```aiken
let result = list_length([1, 2, 3, 4])
-- result will be 4
```

### `head`
Returns the first element of a list.

```aiken
let result = head([1, 2, 3, 4])
-- result will be 1
```

### `tail`
Returns the list without the first element.

```aiken
let result = tail([1, 2, 3, 4])
-- result will be [2, 3, 4]
```

### `append`
Adds an element to the end of a list.

```aiken
let result = append([1, 2, 3], 4)
-- result will be [1, 2, 3, 4]
```

### `map`
Applies a function to each element of a list.

```aiken
let result = map([1, 2, 3], fn(x) -> multiply(x, 2) end)
-- result will be [2, 4, 6]
```

## 6. Option Functions

### `is_some`
Checks if an option is `Some`.

```aiken
let result = is_some(Some(10))
-- result will be true
```

### `is_none`
Checks if an option is `None`.

```aiken
let result = is_none(None)
-- result will be true
```

### `unwrap`
Returns the value inside `Some` or throws an error if `None`.

```aiken
let result = unwrap(Some(10))
-- result will be 10
```

## 7. Result Functions

### `is_ok`
Checks if a result is `Ok`.

```aiken
let result = is_ok(Ok(10))
-- result will be true
```

### `is_error`
Checks if a result is `Error`.

```aiken
let result = is_error(Error("Error occurred"))
-- result will be true
```

### `unwrap_ok`
Returns the value inside `Ok` or throws an error if `Error`.

```aiken
let result = unwrap_ok(Ok(10))
-- result will be 10
```

## 8. Control Flow Functions

### `if`
Conditional branching based on Boolean expressions.

```aiken
let result = if greater_than(10, 5) then
    "Greater"
else
    "Smaller"
end
-- result will be "Greater"
```

### `match`
Pattern matching on algebraic data types.

```aiken
type TokenAction = Mint | Burn

let result = match Mint with
    Mint -> "Minting"
    Burn -> "Burning"
end
-- result will be "Minting"
```

## 9. Cryptographic Functions

### `hash`
Hashes a string using a cryptographic hashing algorithm.

```aiken
let result = hash("Hello, world!")
-- result will be the hash value of "Hello, world!"
```

### `verify_signature`
Verifies a cryptographic signature.

```aiken
let is_valid = verify_signature(public_key, message, signature)
-- result will be true if the signature is valid
```

---

## Conclusion

This list outlines some of the most useful functions available in Aiken-lang for smart contract development. Aiken’s function set provides robust capabilities for handling various types, control flow, and cryptography, making smart contract programming secure, reliable, and efficient.

For more information and advanced use cases, refer to the [official Aiken-lang documentation](https://aiken-lang.org).

---

You can modify this template as needed for your project!
