//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
import './ERC721Connector.sol';
contract KryptoBirdz is ERC721Connector{

    //Create an Array
    string[] public Kryptobirds;
    mapping(string =>bool) _KryptobirdsExists;

    function mint(string memory _Kryptobird) public{
        require(!_KryptobirdsExists[_Kryptobird],"Error - Kryptobird already exist!");
        Kryptobirds.push(_Kryptobird);
        uint _id=Kryptobirds.length-1;
        _mint(msg.sender,_id);
        _KryptobirdsExists[_Kryptobird]=true;
    }

    constructor() ERC721Connector("KryptoBirdz","KBIRD"){
   }
}

