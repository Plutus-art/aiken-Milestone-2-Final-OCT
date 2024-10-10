-- Data type for NFT sale
type SaleDatum = {
    seller: PubKeyHash,
    price: Value
}

-- Redeemer for purchasing the NFT
type PurchaseRedeemer = {
    buyer: PubKeyHash
}

-- Validator function to handle NFT sales
validator sellNFT (datum: SaleDatum) (redeemer: PurchaseRedeemer) (ctx: ScriptContext) : Bool {
    let
        -- Check if the payment matches the price
        paymentValid : Bool = valuePaidTo ctx.txInfo datum.seller == datum.price

        -- Check if the buyer signed the transaction
        buyerSigned : Bool = txSignedBy ctx.txInfo redeemer.buyer
    in
        traceIfFalse "Incorrect payment or buyer not signed" (paymentValid && buyerSigned)
}
