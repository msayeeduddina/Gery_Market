// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract OwnerStorage {
    // Contract which stores the owner  and trader address
    address private owner;
    mapping(address => bool) private traders;
    address private returnAnnouncer;
    address private adminFeeReceiver;

    constructor(address[] memory _traders, address _returnAnnc, address _adminFeeReceiver) {
        owner = msg.sender;
        returnAnnouncer = _returnAnnc;
        adminFeeReceiver = _adminFeeReceiver;
        for (uint256 i = 0; i < _traders.length; i++) {
            traders[_traders[i]] = true;
        }
    }

    function transferOwner(address _newOwner) external {
        require(msg.sender == owner && _newOwner != address(0));
        owner = _newOwner;
    }

    function setTrader(address _trader, bool _set) external {
        require(msg.sender == owner);
        traders[_trader] = _set;
    }

    function setReturnAnnouncer(address _returner) external {
        require(msg.sender == owner);
        returnAnnouncer = _returner;
    }

    function setAdminFeeReceiver(address _rec) external {
        require(msg.sender == owner);
        adminFeeReceiver = _rec;
    }

    function isTrader(address _trader) external view returns(bool) {
        return traders[_trader];
    }

    function getOwner() external view returns(address) {
        return owner;
    }

    function getReturnAnnouncer() external view returns(address) {
        return returnAnnouncer;
    }

    function getAdminFeeReceiver() external view returns(address) {
        return adminFeeReceiver;
    }
}



// import "./Alpha.sol";


// contract OwnerStorage is IOwnerStorage {
    
// //**//    
//     mapping(address => bool) internal isBoolTrader;

//     function setisTrader(address _addr, bool _bool) external {
//        isBoolTrader[_addr]=_bool;
//     }
// //**//    

//     function getOwner() external view returns(address) {
//         return msg.sender;
//     }

//     function isTrader(address _addr) external view returns(bool) {
//         return isBoolTrader[_addr];
//     }

//     function getReturnAnnouncer() external view returns(address) {
//         return msg.sender;
//     }

//     function getAdminFeeReceiver() external view returns(address) {
//         return msg.sender;
//     }

// }



/**

_TRADERS: ["0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2","0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db","0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB","0x617F2E2fD72FD9D5503197092aC168c91465E7f2"]
_RETURNANNC:   0x17F6AD8Ef982297579C203069C1DbfFE4348c372
_ADMINFEERECEIVER:   0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678
setTrader:   0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7

*/
