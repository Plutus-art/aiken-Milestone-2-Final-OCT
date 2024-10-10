
-- Function to validate if the payment matches the expected amount
validatePayment : Value -> Value -> Bool
validatePayment actual expected =
    actual == expected

-- Function to validate a user's signature on the transaction
validateSignature : PubKeyHash -> Signature -> Bool
validateSignature expectedPubKeyHash signature =
    verifySignature(signature, expectedPubKeyHash)  -- Using verifySignature from the library
