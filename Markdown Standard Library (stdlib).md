Here's a markdown write-up for GitHub about the **Standard Library (stdlib)** in Aiken-lang, including code snippets:

---

# Aiken-lang Standard Library (stdlib)

The **Aiken-lang Standard Library (stdlib)** provides a comprehensive set of built-in functions, data types, and utilities that simplify smart contract development on the Cardano blockchain. The stdlib includes essential modules and tools to handle common tasks such as mathematical operations, cryptographic functions, list manipulation, and more.

This guide gives an overview of the key modules in the Aiken-lang standard library, along with code examples.

## Overview of Key Modules

The Aiken standard library is divided into several core modules, each offering specific functionality. These include:

- **Math**: For numerical operations.
- **List**: For manipulating lists and sequences.
- **Option**: To handle nullable types and optional values safely.
- **Crypto**: For cryptographic operations such as hashing.
- **String**: For working with strings.

---

## 1. **Math Module**

The `Math` module includes basic arithmetic functions, comparisons, and other mathematical utilities. It allows developers to perform calculations with integers and other numeric types.

### Example: Basic Arithmetic

```aiken
fn calculate_sum(x: Int, y: Int) -> Int {
    Math.add(x, y)
}

let result = calculate_sum(10, 20)  -- result is 30
```

### Example: Absolute Value

```aiken
let negative_number = -10
let abs_value = Math.abs(negative_number)  -- abs_value is 10
```

### Example: Minimum and Maximum

```aiken
let min_value = Math.min(10, 5)  -- min_value is 5
let max_value = Math.max(10, 5)  -- max_value is 10
```

---

## 2. **List Module**

The `List` module provides functions to manipulate lists, such as adding elements, filtering, and folding. Lists are a core data structure in Aiken-lang, and this module allows efficient handling of sequence data.

### Example: Creating and Concatenating Lists

```aiken
let list1 = [1, 2, 3]
let list2 = [4, 5, 6]
let combined_list = List.concat(list1, list2)  -- combined_list is [1, 2, 3, 4, 5, 6]
```

### Example: Filtering a List

```aiken
let numbers = [1, 2, 3, 4, 5, 6]
let even_numbers = List.filter(numbers, fn(n: Int) -> Bool {
    n % 2 == 0
})  -- even_numbers is [2, 4, 6]
```

### Example: Mapping Over a List

```aiken
let numbers = [1, 2, 3]
let squared_numbers = List.map(numbers, fn(n: Int) -> Int {
    Math.mul(n, n)
})  -- squared_numbers is [1, 4, 9]
```

---

## 3. **Option Module**

The `Option` module helps handle cases where values may or may not be present. Instead of using nulls, Aiken-lang provides the `Option` type, which can either be `Some(value)` or `None`.

### Example: Handling Optional Values

```aiken
fn find_item(index: Int, list: List(Int)) -> Option(Int) {
    if index < List.length(list) then
        Some(List.get(list, index))
    else
        None
    end
}

let numbers = [1, 2, 3]
let item = find_item(1, numbers)  -- item is Some(2)
let missing_item = find_item(5, numbers)  -- missing_item is None
```

### Example: Using Option to Avoid Nulls

```aiken
fn safe_divide(a: Int, b: Int) -> Option(Int) {
    if b == 0 then
        None
    else
        Some(Math.div(a, b))
    end
}

let result = safe_divide(10, 2)  -- result is Some(5)
let division_by_zero = safe_divide(10, 0)  -- division_by_zero is None
```

---

## 4. **Crypto Module**

The `Crypto` module provides cryptographic functions such as hashing, signature verification, and public/private key utilities. These are crucial for ensuring security in smart contracts.

### Example: Hashing with Blake2b

```aiken
let data = "Aiken-lang"
let hash_value = Crypto.blake2b(data)  -- hash_value is the 32-byte Blake2b hash of "Aiken-lang"
```

### Example: SHA-256 Hashing

```aiken
let data = "Secure Data"
let sha256_hash = Crypto.sha256(data)  -- sha256_hash is the SHA-256 hash of "Secure Data"
```

---

## 5. **String Module**

The `String` module offers functions for working with text, such as concatenation, length, splitting, and case conversion.

### Example: String Concatenation

```aiken
let greeting = "Hello"
let name = "World"
let full_message = String.concat(greeting, ", ", name, "!")  -- full_message is "Hello, World!"
```

### Example: Converting to Uppercase

```aiken
let lower = "aiken"
let upper = String.to_upper(lower)  -- upper is "AIKEN"
```

---

## Conclusion

The **Aiken-lang Standard Library (stdlib)** provides a rich set of modules to help you develop secure, efficient, and readable smart contracts on the Cardano blockchain. With built-in support for mathematics, list manipulation, cryptography, string handling, and more, the stdlib simplifies complex operations and enhances developer productivity.

By using the stdlib's well-designed functions, you can write cleaner, more maintainable smart contracts without reinventing the wheel.

For a full reference, explore the [official Aiken-lang documentation](https://aiken-lang.org/docs).

---

This markdown provides an introduction to the stdlib with real-world examples. You can expand this document with more details as needed or provide links to further resources.
