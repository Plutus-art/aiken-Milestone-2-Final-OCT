-- Data type for staking contract
type StakingDatum = {
    staker: PubKeyHash,
    stake_amount: Value,
    rewards_pool: Value
}

-- Redeemer for claiming rewards
type ClaimRedeemer = {
    staker: PubKeyHash
}

-- Validator function to handle staking rewards
validator stakeToken (datum: StakingDatum) (redeemer: ClaimRedeemer) (ctx: ScriptContext) : Bool {
    let
        -- Check if staker signed the transaction
        stakerSigned : Bool = txSignedBy ctx.txInfo datum.staker

        -- Check if there are enough rewards in the pool
        rewardsAvailable : Bool = datum.rewards_pool >= datum.stake_amount
    in
        traceIfFalse "Staker not signed or insufficient rewards" (stakerSigned && rewardsAvailable)
}
