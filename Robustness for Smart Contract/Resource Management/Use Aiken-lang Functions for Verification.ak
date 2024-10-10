-- Define the NFT type
type NFT = { id: Int, owner: PubKeyHash, metadata: String }

-- Function to transfer NFT ownership with formal specification
-- This function ensures that the sender owns the NFT and the signature is valid.
transferNFT : PubKeyHash -> NFT -> PubKeyHash -> Signature -> Result String NFT
transferNFT sender nft newOwner signature =
    if nft.owner == sender then
        if validateSignature(sender, signature) then
            Result.Ok { nft with owner = newOwner }  -- Ownership transferred
        else
            Result.Err "Invalid Signature"
    else
        Result.Err "Sender does not own the NFT"
