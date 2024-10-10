Here’s a GitHub markdown format for the above content to use in a README file:

---

# Aiken-lang Smart Contract Testing

This repository provides a structured approach to testing Aiken-lang smart contracts, covering both **new features** (such as NFT minting, DEX swaps, and secondary sales) and **existing features** (like token transfers). This guide walks through setting up test cases, automating tests, executing them, and capturing the results.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Test Cases](#test-cases)
- [Automating the Testing Process](#automating-the-testing-process)
- [Executing Tests](#executing-tests)
- [Capturing and Reporting Results](#capturing-and-reporting-results)
- [Conclusion](#conclusion)

## Prerequisites

Before testing, ensure you have the following:
- **Aiken-lang** installed on your machine. [Installation Guide](https://aiken-lang.org/docs/installation)
- Access to a **Cardano testnet** or **local test environment**.
- **Test ADA** or **test tokens** to simulate transactions.

## Test Cases

We will create test cases for both old and new features of the smart contracts.

### 1. **Minting an NFT**

```aiken
xfunc mint_nft_test() -> Bool {
    let nft_id = NFTID("test_nft_001");
    let owner = Address.from_bech32("addr_test1...");
    
    let mint_result = mint_nft(nft_id, owner);
    
    assert(mint_result == True, "NFT minting failed.");
    
    return mint_result;
}
```

### 2. **DEX Swap**

```aiken
xfunc dex_swap_test() -> Bool {
    let token_in = Token("token_a");
    let amount_in = Amount(100);
    let token_out = Token("token_b");

    let swap_result = dex_swap(token_in, amount_in, token_out);
    
    assert(swap_result == True, "DEX swap failed.");
    
    return swap_result;
}
```

### 3. **Secondary Sale Royalty Payment**

```aiken
xfunc secondary_sale_test() -> Bool {
    let nft_id = NFTID("test_nft_001");
    let sale_price = Amount(1000);

    let sale_result = handle_secondary_sale(nft_id, sale_price);
    
    assert(sale_result == True, "Secondary sale royalty failed.");
    
    return sale_result;
}
```

### 4. **Basic Token Transfer**

```aiken
xfunc token_transfer_test() -> Bool {
    let sender = Address.from_bech32("addr_test1...");
    let recipient = Address.from_bech32("addr_test1...");
    let amount = Amount(500);

    let transfer_result = transfer_tokens(sender, recipient, amount);
    
    assert(transfer_result == True, "Token transfer failed.");
    
    return transfer_result;
}
```

## Automating the Testing Process

To streamline testing, you can create a shell script to automate the execution of all test cases.

### Example Shell Script

```bash
#!/bin/bash

echo "Running Aiken-lang Smart Contract Tests..."

# Compile the contracts
aiken build

# Run each test case and capture results
echo "Testing NFT Minting..."
aiken test mint_nft_test

echo "Testing DEX Swap..."
aiken test dex_swap_test

echo "Testing Secondary Sale..."
aiken test secondary_sale_test

echo "Testing Token Transfer..."
aiken test token_transfer_test

echo "All tests executed."
```

## Executing Tests

To execute tests manually, you can use the following command for each test case:

```bash
aiken test path/to/test_file
```

Alternatively, you can use the provided shell script:

```bash
./run_tests.sh
```

This will compile and run all test cases.

## Capturing and Reporting Results

### Logging Test Results

You can capture test results to a log file for further review.

```bash
#!/bin/bash

LOGFILE="test_results.log"
echo "Aiken-lang Smart Contract Test Results" > $LOGFILE

echo "Running tests..." | tee -a $LOGFILE

echo "Testing NFT Minting..." | tee -a $LOGFILE
aiken test mint_nft_test | tee -a $LOGFILE

echo "Testing DEX Swap..." | tee -a $LOGFILE
aiken test dex_swap_test | tee -a $LOGFILE

echo "Testing Secondary Sale..." | tee -a $LOGFILE
aiken test secondary_sale_test | tee -a $LOGFILE

echo "Testing Token Transfer..." | tee -a $LOGFILE
aiken test token_transfer_test | tee -a $LOGFILE

echo "Tests complete. See $LOGFILE for results."
```

### Example Test Report

The test result log file (`test_results.log`) could look like this:

```
Aiken-lang Smart Contract Test Results
--------------------------------------
Running tests...

Testing NFT Minting...
[OK] Test passed: NFT minting was successful.

Testing DEX Swap...
[FAIL] Test failed: DEX swap did not return expected result.

Testing Secondary Sale...
[OK] Test passed: Secondary sale royalty was paid successfully.

Testing Token Transfer...
[OK] Test passed: Token transfer was successful.

Tests complete. See test_results.log for detailed output.
```

## Conclusion

This repository demonstrates how to test both new and old features of Aiken-lang smart contracts. It provides test cases for each function, a script for automating the tests, and methods for logging and reviewing test results.

### Features Tested:
- **NFT Minting**
- **DEX Swap**
- **Secondary Sale with Royalty**
- **Token Transfer**

### Results:
All test results are captured and logged for easy review.



