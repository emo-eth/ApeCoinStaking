// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface ApeCoinStakingEvents {
    event UpdatePool(
        uint256 indexed poolId, uint256 lastRewardedBlock, uint256 stakedAmount, uint256 accumulatedRewardsPerShare
    );
    event Deposit(address indexed user, uint256 amount, address recipient);
    event DepositNft(address indexed user, uint256 indexed poolId, uint256 amount, uint256 tokenId);
    event DepositPairNft(
        address indexed user, uint256 amount, uint256 mainTypePoolId, uint256 mainTokenId, uint256 bakcTokenId
    );
    event Withdraw(address indexed user, uint256 amount, address recipient);
    event WithdrawNft(address indexed user, uint256 indexed poolId, uint256 amount, address recipient, uint256 tokenId);
    event WithdrawPairNft(
        address indexed user, uint256 amount, uint256 mainTypePoolId, uint256 mainTokenId, uint256 bakcTokenId
    );
    event ClaimRewards(address indexed user, uint256 amount, address recipient);
    event ClaimRewardsNft(address indexed user, uint256 indexed poolId, uint256 amount, uint256 tokenId);
    event ClaimRewardsPairNft(
        address indexed user, uint256 amount, uint256 mainTypePoolId, uint256 mainTokenId, uint256 bakcTokenId
    );
}
