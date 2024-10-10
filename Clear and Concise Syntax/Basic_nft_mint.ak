-- Data type for NFT Minting
type MintingDatum = {
    authorized_minter: PubKeyHash,
    nft_metadata: String
}

-- Validator function to check minting permissions
validator mintNFT (datum: MintingDatum) (redeemer: Unit) (ctx: ScriptContext) : Bool {
    let
        -- Check if the transaction is signed by the authorized minter
        minterSigned : Bool = txSignedBy ctx.txInfo datum.authorized_minter
    in
        traceIfFalse "Minter not authorized" minterSigned
}
