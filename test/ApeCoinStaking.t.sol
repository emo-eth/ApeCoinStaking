// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { BaseTest } from "./BaseTest.sol";
import { IERC721 } from "forge-std/interfaces/IERC721.sol";
import { IERC20 } from "forge-std/interfaces/IERC20.sol";
import { SingleNft, PairNftDepositWithAmount } from "../src/ApeCoinStakingStructs.sol";

contract ApeCoinStakingTest is BaseTest {
    function setUp() public override {
        super.setUp();
        grantToken(BAYC, 1, address(this));
        grantToken(MAYC, 1, address(this));
        grantToken(BAKC, 1, address(this));
        grantToken(BAKC, 2, address(this));

        dealAndApproveApe(address(this), 100e18);
    }

    function testCanCallDepositSelfApeCoin() public {
        stake.depositSelfApeCoin(100e18);
    }

    function testCanCallDepositBAYC() public {
        stake.depositBAYC(toSingleNftArray(1, 100e18));
    }

    function testCanCallDepositMAYC() public {
        stake.depositMAYC(toSingleNftArray(1, 100e18));
    }

    function testCanCallDepositBAKC() public {
        stake.depositBAKC(toPairNftDepositWithAmountArray(1, 1, 50e18), toPairNftDepositWithAmountArray(1, 2, 50e18));
    }

    /**
     * @dev helper to create a SingleNft array with a single element
     */
    function toSingleNftArray(uint32 tokenId, uint224 amount) internal pure returns (SingleNft[] memory) {
        SingleNft[] memory nfts = new SingleNft[](1);
        nfts[0] = SingleNft({tokenId: tokenId, amount: amount});
        return nfts;
    }

    /**
     * @dev helper to create a PairNftDepositWithAmount array with a single element
     */
    function toPairNftDepositWithAmountArray(uint32 mainTokenId, uint32 bakcTokenId, uint184 amount)
        internal
        pure
        returns (PairNftDepositWithAmount[] memory)
    {
        PairNftDepositWithAmount[] memory nfts = new PairNftDepositWithAmount[](1);
        nfts[0] = PairNftDepositWithAmount({mainTokenId: mainTokenId, bakcTokenId: bakcTokenId, amount: amount});
        return nfts;
    }
}
