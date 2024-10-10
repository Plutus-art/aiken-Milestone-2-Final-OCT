-- NFT Marketplace Smart Contract using Functional Programming

-- Data types for NFT listing and purchase redeemer
type Listing = { seller: PubKeyHash, price: Value }
type Purchase = { buyer: PubKeyHash }

-- Pure function to create an NFT listing
listNFT : PubKeyHash -> Value -> Listing
listNFT seller price = {
    seller = seller,
    price = price
}

-- Pure function to create a purchase redeemer
buyNFT : PubKeyHash -> Purchase
buyNFT buyer = {
    buyer = buyer
}

-- Validator to handle the NFT sale, ensuring payment is correct
validator sellNFT (datum: Listing) (redeemer: Purchase) (ctx: ScriptContext) : Bool {
    let
        paymentValid : Bool = valuePaidTo ctx.txInfo datum.seller == datum.price
        buyerSigned : Bool = txSignedBy ctx.txInfo redeemer.buyer
    in
        traceIfFalse "Incorrect payment or buyer not signed" (paymentValid && buyerSigned)
}
