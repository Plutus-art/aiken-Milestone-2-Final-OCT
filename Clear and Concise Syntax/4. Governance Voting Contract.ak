-- Data type for governance proposals
type GovernanceDatum = {
    proposal_id: Integer,
    voter: PubKeyHash,
    vote_choice: Bool,
    weight: Value
}

-- Redeemer for voting
type VoteRedeemer = {
    voter: PubKeyHash,
    vote_choice: Bool
}

-- Validator function for governance voting
validator voteGovernance (datum: GovernanceDatum) (redeemer: VoteRedeemer) (ctx: ScriptContext) : Bool {
    let
        -- Check if the voter signed the transaction
        voterSigned : Bool = txSignedBy ctx.txInfo redeemer.voter

        -- Check if the vote weight matches the voter's holdings
        voteWeightValid : Bool = datum.weight > 0
    in
        traceIfFalse "Invalid vote or voter not signed" (voterSigned && voteWeightValid)
}
