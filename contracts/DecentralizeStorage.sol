// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract DecentralizedStorage {
    struct File {
        string fileHash;
        string fileName;
        uint fileSize;
        address owner;
        mapping(address => bool) accessList;
    }

    mapping(bytes32 => File) public files;

    function uploadFile(string memory _fileHash, string memory _fileName, uint _fileSize) public {
        bytes32 fileId = keccak256(abi.encodePacked(_fileHash, msg.sender));
        File storage newFile = files[fileId];
        newFile.fileHash = _fileHash;
        newFile.fileName = _fileName;
        newFile.fileSize = _fileSize;
        newFile.owner = msg.sender;
    }

    function grantAccess(bytes32 fileId, address _user) public {
        require(files[fileId].owner == msg.sender, "Not the owner");
        files[fileId].accessList[_user] = true;
    }

    function checkAccess(bytes32 fileId) public view returns (bool) {
        return files[fileId].accessList[msg.sender];
    }
}