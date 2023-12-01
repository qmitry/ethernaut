// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperOne {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    require(gasleft() % 8191 == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}

contract GatekeeperOneHack {
    GatekeeperOne public curGatekeeperOne;

    constructor(address GatekeeperOneAdr) {
        curGatekeeperOne = GatekeeperOne(GatekeeperOneAdr);
    }

    function f1 (bytes8 _a) public pure returns (uint64){
        return uint64(_a);
    }

    function f2 (bytes8 _a) public pure returns (uint16){
        return uint16(uint64(_a));
    }

    function f3 (bytes8 _a) public pure returns (uint32){
        return uint32(uint64(_a));
    }

    function f4 () public view returns (uint32){
        return uint16(uint160(tx.origin));
    }
}