// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {TimelockController} from "@openzeppelin/contracts/governance/TimelockController.sol";

contract TimeLock is TimelockController {
    //minDelay how long wait to executed
    //proposers is the list of addresses that  can propose
    //executors is the list of addresses that can execute
    constructor(uint256 mintDelay, address[] memory proposers, address[] memory executors)
        TimelockController(mintDelay, proposers, executors, msg.sender)
    {}
}
