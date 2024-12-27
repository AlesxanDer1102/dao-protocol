// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test} from "forge-std/Test.sol";
import {MoonGovernor} from "../src/MoonGovernor.sol";
import {Box} from "../src/Box.sol";
import {TimeLock} from "../src/TimeLock.sol";
import {MoonToken} from "../src/MoonToken.sol";

contract MyGovernorTest is Test {
    MoonGovernor moonGovernor;
    Box box;
    TimeLock timeLock;
    MoonToken moonToken;

    address public USER =makeAddr("user");

    uint256 public constant INITIAL_SUPPLY = 100 ether;

    address[] proposers;
    address[] executors;

    uint256 public constant MIN_DELAY =  3600;

    function setUp() public {
        moonToken = new MoonToken();
        moonToken.mint(USER, INITIAL_SUPPLY);
        vm.startPrank(USER);
        moonToken.delegate(USER);
        timeLock = new TimeLock(MIN_DELAY,proposers,executors);
        moonGovernor = new MoonGovernor(moonToken, timeLock);

        bytes32 proposeRole=timeLock.PROPOSER_ROLE();
        bytes32 executeRole=timeLock.EXECUTOR_ROLE();
        bytes32 adminRole=timeLock.DEFAULT_ADMIN_ROLE();

        timeLock.grantRole(proposeRole, address(moonGovernor));
        timeLock.grantRole(executeRole, address(0));
        timeLock.revokeRole(adminRole, USER);

        box = new Box();
        box.transferOwnership(address(timeLock));

        vm.stopPrank();
    }

    function testCantUpdateBoxWithoutGovernance() public {
        vm.expectRevert();
        box.store(1);
    }
}
