pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] public players;
    function Lottery() public {
        manager = msg.sender;
    }
    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
        
    }

    function random() public view returns (uint) {
        // return uint(sha3(block.difficulty, now, players));
        return uint(keccak256(block.difficulty, now, players));
    }

    function pickWinner() public onlyManagerCanCall {
        
        uint index = random() %  players.length;
        players[index].transfer(this.balance);
        players = new address[](0);
    }

    modifier onlyManagerCanCall() {
        require(msg.sender == manager);
        _;
    }
    function getPlayers() public view returns (address[]) {
        return players;
    }
}