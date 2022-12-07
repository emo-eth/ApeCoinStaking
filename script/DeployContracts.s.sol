// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { Script, console2 } from "forge-std/Script.sol";
import { ApeCoinStaking } from "../src/ApeCoinStaking.sol";
import { ApeCoinStakedVoting } from "../src/ApeCoinStakedVoting.sol";

contract DeployContracts is Script {
    uint256 constant NINETY_ONE_DAYS = 91 days;
    uint256 constant NINETY_TWO_DAYS = 92 days;
    uint256 startTime;
    uint256 endFirstQuarter;
    uint256 endSecondQuarter;
    uint256 endThirdQuarter;
    uint256 endFourthQuarter;

    ApeCoinStaking apeCoinStaking;
    ApeCoinStakedVoting apeCoinStakedVoting;

    function run() public {
        configureTimeStamps();

        deployContracts();
        configureStakingContract();
    }

    /**
     * @dev Configure the quarter start and end times for the staking contract TimeRanges
     */
    function configureTimeStamps() internal {
        startTime = block.timestamp + secondsUntilNextHour(block.timestamp);
        endFirstQuarter = startTime + NINETY_ONE_DAYS;
        endSecondQuarter = endFirstQuarter + NINETY_TWO_DAYS;
        endThirdQuarter = endSecondQuarter + NINETY_ONE_DAYS;
        endFourthQuarter = endThirdQuarter + NINETY_ONE_DAYS;
    }

    /**
     * @dev Calculate the number of seconds until the next hour
     */
    function secondsUntilNextHour(uint256 timestamp) public pure returns (uint256) {
        return 1 hours - (timestamp % 1 hours);
    }

    /**
     * @dev Deploy the staking and voting contracts
     */
    function deployContracts() internal {
        address apeCoin = vm.envAddress("APECOIN_CONTRACT_ADDRESS");
        address bayc = vm.envAddress("BAYC_CONTRACT_ADDRESS");
        address mayc = vm.envAddress("MAYC_CONTRACT_ADDRESS");
        address bakc = vm.envAddress("BAKC_CONTRACT_ADDRESS");
        apeCoinStaking = new ApeCoinStaking(apeCoin,bayc,mayc,bakc);
        apeCoinStakedVoting = new ApeCoinStakedVoting(address(apeCoinStaking));
    }

    /**
     * @dev Configure the staking contract with the same TimeRanges as configured on Mainnet
     */
    function configureStakingContract() internal {
        apeCoinStaking.addTimeRange(0, 10_500_000 ether, startTime, endFirstQuarter, 0);
        console2.log(
            string.concat(
                "First Quarter from ",
                vm.toString(startTime),
                " to ",
                vm.toString(endFirstQuarter),
                " for Ape Coin Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(0, 9_000_000 ether, endFirstQuarter, endSecondQuarter, 0);
        console2.log(
            string.concat(
                "Second Quarter from ",
                vm.toString(endFirstQuarter),
                " to ",
                vm.toString(endSecondQuarter),
                " for Ape Coin Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(0, 6_000_000 ether, endSecondQuarter, endThirdQuarter, 0);
        console2.log(
            string.concat(
                "Third Quarter from ",
                vm.toString(endSecondQuarter),
                " to ",
                vm.toString(endThirdQuarter),
                " for Ape Coin Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(0, 4_500_000 ether, endThirdQuarter, endFourthQuarter, 0);
        console2.log(
            string.concat(
                "Fourth Quarter from ",
                vm.toString(endThirdQuarter),
                " to ",
                vm.toString(endFourthQuarter),
                " for Ape Coin Pool added...\n"
            )
        );

        // BAYC Pool
        apeCoinStaking.addTimeRange(1, 16_486_750 ether, startTime, endFirstQuarter, 10_094 ether);
        console2.log(
            string.concat(
                "First Quarter from ",
                vm.toString(startTime),
                " to ",
                vm.toString(endFirstQuarter),
                " for BAYC Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(1, 14_131_500 ether, endFirstQuarter, endSecondQuarter, 10_094 ether);
        console2.log(
            string.concat(
                "Second Quarter from ",
                vm.toString(endFirstQuarter),
                " to ",
                vm.toString(endSecondQuarter),
                " for BAYC Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(1, 9_421_000 ether, endSecondQuarter, endThirdQuarter, 10_094 ether);
        console2.log(
            string.concat(
                "Third Quarter from ",
                vm.toString(endSecondQuarter),
                " to ",
                vm.toString(endThirdQuarter),
                " for BAYC Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(1, 7_065_750 ether, endThirdQuarter, endFourthQuarter, 10_094 ether);
        console2.log(
            string.concat(
                "Fourth Quarter from ",
                vm.toString(endThirdQuarter),
                " to ",
                vm.toString(endFourthQuarter),
                " for BAYC Pool added...\n"
            )
        );

        // MAYC Pool
        apeCoinStaking.addTimeRange(2, 6_671_000 ether, startTime, endFirstQuarter, 2042 ether);
        console2.log(
            string.concat(
                "First Quarter from ",
                vm.toString(startTime),
                " to ",
                vm.toString(endFirstQuarter),
                " for MAYC Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(2, 5_718_000 ether, endFirstQuarter, endSecondQuarter, 2042 ether);
        console2.log(
            string.concat(
                "Second Quarter from ",
                vm.toString(endFirstQuarter),
                " to ",
                vm.toString(endSecondQuarter),
                " for MAYC Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(2, 3_812_000 ether, endSecondQuarter, endThirdQuarter, 2042 ether);
        console2.log(
            string.concat(
                "Third Quarter from ",
                vm.toString(endSecondQuarter),
                " to ",
                vm.toString(endThirdQuarter),
                " for MAYC Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(2, 2_859_000 ether, endThirdQuarter, endFourthQuarter, 2042 ether);
        console2.log(
            string.concat(
                "Fourth Quarter from ",
                vm.toString(endThirdQuarter),
                " to ",
                vm.toString(endFourthQuarter),
                " for MAYC Pool added...\n"
            )
        );

        // BAKC Pool
        apeCoinStaking.addTimeRange(3, 1_342_250 ether, startTime, endFirstQuarter, 856 ether);
        console2.log(
            string.concat(
                "First Quarter from ",
                vm.toString(startTime),
                " to ",
                vm.toString(endFirstQuarter),
                " for BAKC Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(3, 1_150_500 ether, endFirstQuarter, endSecondQuarter, 856 ether);
        console2.log(
            string.concat(
                "Second Quarter from ",
                vm.toString(endFirstQuarter),
                " to ",
                vm.toString(endSecondQuarter),
                " for BAKC Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(3, 767_000 ether, endSecondQuarter, endThirdQuarter, 856 ether);
        console2.log(
            string.concat(
                "Third Quarter from ",
                vm.toString(endSecondQuarter),
                " to ",
                vm.toString(endThirdQuarter),
                " for BAKC Pool added..."
            )
        );
        apeCoinStaking.addTimeRange(3, 575_250 ether, endThirdQuarter, endFourthQuarter, 856 ether);
        console2.log(
            string.concat(
                "Fourth Quarter from ",
                vm.toString(endThirdQuarter),
                " to ",
                vm.toString(endFourthQuarter),
                " for BAKC Pool added...\n"
            )
        );
    }
}
