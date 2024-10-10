Here’s a markdown write-up for GitHub with a list of newly developed functions in Aiken-lang, including code snippets to demonstrate their usage:

---

# New Functions in Aiken-lang

This document provides a list of all newly developed functions available in Aiken-lang for smart contract development on the Cardano blockchain. Each function is designed to enhance contract capabilities and streamline common operations.

## 1. **`filter`**: Filter Elements in a List

The `filter` function filters elements from a list based on a condition.

### Usage:

```aiken
-- Filter even numbers from a list
let even_numbers = List.filter(fn (n: Int) -> Bool { n % 2 == 0 }) [1, 2, 3, 4, 5, 6]
-- Result: [2, 4, 6]
```

### Explanation:
- `List.filter` accepts a lambda function that takes each element and returns a boolean indicating whether the element should remain in the list.

## 2. **`map`**: Transform Each Element in a List

The `map` function applies a transformation to each element in a list.

### Usage:

```aiken
-- Double each number in a list
let doubled_numbers = List.map(fn (n: Int) -> Int { n * 2 }) [1, 2, 3, 4]
-- Result: [2, 4, 6, 8]
```

### Explanation:
- `List.map` applies a function to each element and returns a new list with the transformed values.

## 3. **`fold`**: Reduce a List to a Single Value

The `fold` function reduces a list into a single value by applying a binary operation.

### Usage:

```aiken
-- Sum all numbers in a list
let sum = List.fold(fn (acc: Int, n: Int) -> Int { acc + n }) 0 [1, 2, 3, 4, 5]
-- Result: 15
```

### Explanation:
- `List.fold` takes an initial accumulator value and applies a function that combines each list element with the accumulator.

## 4. **`Option.map`**: Transform a Value Inside an Option

The `Option.map` function applies a function to the value inside an `Option`, if it exists.

### Usage:

```aiken
-- Add 10 to an optional number
let result = Option.map(fn (n: Int) -> Int { n + 10 }) Some(5)
-- Result: Some(15)
```

### Explanation:
- If the `Option` contains a value, the function is applied; otherwise, the result is `None`.

## 5. **`Result.and_then`**: Chain Result Computations

The `and_then` function allows you to chain operations on `Result` values. It only performs the next operation if the result is `Ok`.

### Usage:

```aiken
-- Chain operations that might fail
let result = Result.and_then(fn (x: Int) -> Result(Int, String) { Result.Ok(x * 2) }) (Result.Ok(5))
-- Result: Ok(10)
```

### Explanation:
- `and_then` enables chaining of operations, allowing you to propagate success or failure conditions.

## 6. **`String.split`**: Split a String into a List of Substrings

The `split` function breaks a string into a list of substrings based on a delimiter.

### Usage:

```aiken
-- Split a sentence into words
let words = String.split(" ", "Aiken-lang is great!")
-- Result: ["Aiken-lang", "is", "great!"]
```

### Explanation:
- The `String.split` function breaks the input string at each occurrence of the delimiter and returns a list of substrings.

## 7. **`Dict.get`**: Fetch a Value from a Dictionary

The `Dict.get` function retrieves a value associated with a key in a dictionary.

### Usage:

```aiken
-- Get the value associated with a key
let value = Dict.get("token", Dict.from_list([("token", 100), ("nft", 50)]))
-- Result: Some(100)
```

### Explanation:
- `Dict.get` returns `Some(value)` if the key is found, or `None` if it doesn’t exist.

## 8. **`Tuple.map`**: Apply a Function to a Tuple

The `Tuple.map` function applies a function to the elements of a tuple.

### Usage:

```aiken
-- Add 10 to the first element of a tuple
let new_tuple = Tuple.map(fn (a: Int) -> Int { a + 10 }) (5, "NFT")
-- Result: (15, "NFT")
```

### Explanation:
- `Tuple.map` allows transformation of tuple elements by applying a function to them.

## 9. **`Option.unwrap_or`**: Extract Value with Fallback

The `unwrap_or` function returns the value inside an `Option`, or a fallback value if it's `None`.

### Usage:

```aiken
-- Get the value from an option, or a fallback
let result = Option.unwrap_or(0, None)
-- Result: 0
```

### Explanation:
- If the `Option` is `Some`, the contained value is returned; otherwise, the fallback value is used.

## 10. **`String.to_int`**: Convert a String to an Integer

The `String.to_int` function converts a string to an integer if it contains a valid number.

### Usage:

```aiken
-- Convert string to integer
let number = String.to_int("42")
-- Result: Some(42)
```

### Explanation:
- If the string is a valid number, `String.to_int` returns `Some(number)`; otherwise, it returns `None`.

---

### Conclusion

These newly developed functions in Aiken-lang enhance the ability to manage data structures, handle results and options, and perform operations on common types like strings and lists. They help improve both the expressiveness and safety of your smart contracts on Cardano.

For more detailed examples and documentation, refer to the official Aiken-lang [documentation](https://aiken-lang.org).

--- 

This markdown format should provide an effective overview of the new functions along with practical code snippets for each.
