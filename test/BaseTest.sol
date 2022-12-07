// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { Test } from "forge-std/Test.sol";
import { ApeCoinStaking } from "../src/ApeCoinStaking.sol";
import { ApeCoinStakedVoting } from "../src/ApeCoinStakedVoting.sol";
import { IERC721 } from "forge-std/interfaces/IERC721.sol";
import { IERC20 } from "forge-std/interfaces/IERC20.sol";

contract BaseTest is Test {
    // test against the deployed contracts
    ApeCoinStaking stake = ApeCoinStaking(0x5954aB967Bc958940b7EB73ee84797Dc8a2AFbb9);
    ApeCoinStakedVoting voting = ApeCoinStakedVoting(0x0187Ae64E905b4FE7Dd1568a5642fbEf05E96e71);

    IERC20 APECOIN = IERC20(0x4d224452801ACEd8B2F0aebE155379bb5D594381);
    IERC721 BAYC = IERC721(0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D);
    IERC721 MAYC = IERC721(0x60E4d786628Fea6478F785A6d7e704777c86a7c6);
    IERC721 BAKC = IERC721(0xba30E5F9Bb24caa003E9f2f0497Ad287FDF95623);

    uint256 constant APECOIN_POOL_ID = 0;
    uint256 constant BAYC_POOL_ID = 1;
    uint256 constant MAYC_POOL_ID = 2;
    uint256 constant BAKC_POOL_ID = 3;

    function setUp() public virtual {
        // always fork mainnet at block 16131000 (2022-12-07 06:13:35)
        vm.createSelectFork(stdChains["mainnet"].rpcUrl, 16119274);
    }

    /**
     * @dev Deal a specified amount of $APE to a recipient and approve the staking contract to transfer all of the recipient's $APE.
     */
    function dealAndApproveApe(address to, uint256 amount) public {
        deal(address(APECOIN), to, amount);
        vm.prank(to);
        APECOIN.approve(address(stake), type(uint256).max);
    }

    /**
     * @dev Grant the specified (already existing) token ID belonging to the specified ERC721 token to the specified recipient.
     */
    function grantToken(IERC721 token, uint256 id, address recipient) internal {
        address originalOwner = token.ownerOf(id);
        vm.prank(originalOwner);
        token.transferFrom(originalOwner, recipient, id);
    }
}
