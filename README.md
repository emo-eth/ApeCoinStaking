#ApeCoinStaking

Did not find the original source + test suite, so I pulled from the [Etherscan link](https://etherscan.io/address/0x5954aB967Bc958940b7EB73ee84797Dc8a2AFbb9) tweeted by the authors, [Horizen Labs](https://horizenlabs.io/).

Set up as a Foundry project.

## Changes

Changed schema from `pragma solidity 0.8.10;` to `pragma solidity ^0.8.10;` to facilitate building extensions in the repository with newer versions of Solidity.

Also was formatted with default `forge fmt` settings.