

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract DeadMansSwitch {
    using SafeMath for uint256;

    uint256 public blockTime;
    address public ownAddress = 0x2070c6447d7DbA51c94C40E1e21Fb1F1F79bd6f2;
    
    constructor() {
        ownAddress = msg.sender;
        blockTime = block.number;
    }

    uint256 public Balance;

    modifier onlyOwner() {
        require(msg.sender == ownAddress);
        _;
    }

    function transEthers(uint256 amount) public onlyOwner {
        require(Balance >= amount);
        Balance = Balance.sub(amount);
        payable(ownAddress).transfer(amount);
    }

    function still_alive() public onlyOwner {
        require(block.number - blockTime <= 10);
        blockTime = block.number;
    }

    function mansDead() public {
        require(block.number - blockTime > 10);
        uint256 ethBalance = address(this).balance;
        payable(ownAddress).transfer(ethBalance);
    }


}