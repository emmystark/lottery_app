pragma solidity ^0.4.17;



contract Lottery {

    address public  manager;

    function Lottery() public {
        const manager = msg.sender;
    }
    address public players;
}