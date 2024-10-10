-- Create a listing datum representing the NFT sale
listNFT : PubKeyHash -> Value -> Listing
listNFT seller price = {
    seller = seller,
    price = price
}
