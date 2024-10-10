test "performance: mint 10,000 NFTs" {
    let start_time = now()
    
    for i in 1..10000 {
        mint_nft(addr("addr_test1..."), "PerformanceNFT#{i}")
    }
    
    let end_time = now()
    let duration = end_time - start_time
    
    assert(duration < 5000) // Ensure it completes within 5 seconds
}
