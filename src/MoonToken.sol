// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit, Nonces} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20Votes} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract MoonToken is ERC20, ERC20Permit, ERC20Votes {
    constructor() ERC20("MoonToken", "MOON") ERC20Permit("MoonToken") {}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
    
    
    function _mint(address to, uint256 amount) internal override(ERC20,ERC20Votes) {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount) internal  override(ERC20,ERC20Votes) {
        super._burn(account, amount);
    }   

    function _update(address from, address to, uint256 value) internal  override(ERC20, ERC20Votes) {
        super._update(from, to, value);
    }

    function nonces(address owner) public view override(ERC20Permit, Nonces) returns (uint256) {
        return super.nonces(owner);
    }
}
