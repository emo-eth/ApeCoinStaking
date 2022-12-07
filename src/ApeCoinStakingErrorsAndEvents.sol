// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface ApeCoinStakingErrorsAndEvents {
    /**
     * Custom Events
     */
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

    error DepositMoreThanOneAPE();
    error InvalidPoolId();
    error StartMustBeGreaterThanEnd();
    error StartNotWholeHour();
    error EndNotWholeHour();
    error StartMustEqualLastEnd();
    error CallerNotOwner();
    error MainTokenNotOwnedOrPaired();
    error BAKCNotOwnedOrPaired();
    error BAKCAlreadyPaired();
    error ExceededCapAmount();
    error NotOwnerOfMain();
    error NotOwnerOfBAKC();
    error ProvidedTokensNotPaired();
    error ExceededStakedAmount();
    error NeitherTokenInPairOwnedByCaller();
    error SplitPairCantPartiallyWithdraw();
    error UncommitWrongParameters();
}
