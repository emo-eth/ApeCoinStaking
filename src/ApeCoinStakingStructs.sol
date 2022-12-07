// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @notice State for ApeCoin, BAYC, MAYC, and Pair Pools
struct Pool {
    uint48 lastRewardedTimestampHour;
    uint16 lastRewardsRangeIndex;
    uint96 stakedAmount;
    uint96 accumulatedRewardsPerShare;
    TimeRange[] timeRanges;
}

/// @notice Pool rules valid for a given duration of time.
/// @dev All TimeRange timestamp values must represent whole hours
struct TimeRange {
    uint48 startTimestampHour;
    uint48 endTimestampHour;
    uint96 rewardsPerHour;
    uint96 capPerPosition;
}

/// @dev Convenience struct for front-end applications
struct PoolUI {
    uint256 poolId;
    uint256 stakedAmount;
    TimeRange currentTimeRange;
}

/// @dev Per address amount and reward tracking
struct Position {
    uint256 stakedAmount;
    int256 rewardsDebt;
}

/// @dev Struct for depositing and withdrawing from the BAYC and MAYC NFT pools
struct SingleNft {
    uint32 tokenId;
    uint224 amount;
}
/// @dev Struct for depositing from the BAKC (Pair) pool

struct PairNftDepositWithAmount {
    uint32 mainTokenId;
    uint32 bakcTokenId;
    uint184 amount;
}
/// @dev Struct for withdrawing from the BAKC (Pair) pool

struct PairNftWithdrawWithAmount {
    uint32 mainTokenId;
    uint32 bakcTokenId;
    uint184 amount;
    bool isUncommit;
}
/// @dev Struct for claiming from an NFT pool

struct PairNft {
    uint128 mainTokenId;
    uint128 bakcTokenId;
}
/// @dev NFT paired status.  Can be used bi-directionally (BAYC/MAYC -> BAKC) or (BAKC -> BAYC/MAYC)

struct PairingStatus {
    uint248 tokenId;
    bool isPaired;
}

// @dev UI focused payload
struct DashboardStake {
    uint256 poolId;
    uint256 tokenId;
    uint256 deposited;
    uint256 unclaimed;
    uint256 rewards24hr;
    DashboardPair pair;
}
/// @dev Sub struct for DashboardStake

struct DashboardPair {
    uint256 mainTokenId;
    uint256 mainTypePoolId;
}
