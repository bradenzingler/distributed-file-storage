// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract StringStorage {
    string public storedData;

    function set(string memory _stringToStore) public {
        storedData = _stringToStore;
    }

    function get() public view returns (string memory) {
        return storedData;
    }
}