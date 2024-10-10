-- Simplified pseudo-code example of verification
verifyTransferNFT : PubKeyHash -> NFT -> PubKeyHash -> Signature -> Bool
verifyTransferNFT sender nft newOwner signature =
    -- Check preconditions
    let senderOwnsNFT = nft.owner == sender
    let signatureValid = validateSignature(sender, signature)
    -- Check postconditions
    let ownershipTransferred = nft.owner == newOwner
    senderOwnsNFT && signatureValid && ownershipTransferred
