-- Defining a transaction record
type Transaction = { buyer: PubKeyHash, seller: PubKeyHash, nft: NFT, price: Value }

-- Function to create a new transaction
createTransaction : PubKeyHash -> PubKeyHash -> NFT -> Value -> Transaction
createTransaction buyer seller nft price =
    { buyer = buyer, seller = seller, nft = nft, price = price }
