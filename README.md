# ApeCoinStaking

**This is not the official ApeCoinStaking Repository**


The ApeCoinStaking repository was not public at immediate launch, so I pulled the source from the [Etherscan link](https://etherscan.io/address/0x5954aB967Bc958940b7EB73ee84797Dc8a2AFbb9) tweeted by the authors, [Horizen Labs](https://horizenlabs.io/), and set it up as a Foundry project ***with some modifications to aid development.***

The [official contract repository](https://github.com/HorizenLabs/ape-staking-public), configured for HardHat, is available on the Horizen Labs GitHub account.


## Included Contracts
### ApeCoinStaking
This is the main contract that handles staking and rewards.

### ApeCoinStakedVoting
This contract allows users to vote on proposals using their staked ApeCoin.
## Changes

- The deploy script included in the original Horizen Labs repository has been ported as a Foundry Script (`script/DeployContracts.s.sol`)
- Changed schema from `pragma solidity 0.8.10;` to `pragma solidity ^0.8.10;` to facilitate building extensions in forks of this repository with newer versions of Solidity
  - To more closely match the deployed contract, you may change the `solc` config in `foundry.toml` to `0.8.10`
- Structs have been pulled into their own file (`lib/ApeCoinStakingStructs.sol`) as top-level members for ease of import into other files
- Errors have been pulled into their own file (`lib/ApeCoinStakingErrors.sol`) for ease of import into  other files
- Events have been pulled into a separate interface (`lib/ApeCoinStakingEvents.sol`) for ease of inheritance by test contracts
- Formatted with `forge fmt` with custom settings in `foundry.toml`

## Testing

The included `BaseTest.sol` is meant as a base for writing Foundry tests. It configures a fork of Ethereum Mainnet at block 16131000, and includes internal variables that point to all relevant mainnet smart contracts. It also includes helper functions to grant ApeCoin or BAYC/MAYC/BAKC tokens to specified accounts to facilitate testing.

The included `ApeCoinStaking.t.sol` inherits from `BaseTest.sol`, grants the test contract some ApeCoin and relevant NFTs, and ensures it can call the main deposit methods on the ApeCoinStaking contract as deployed on Mainnet.