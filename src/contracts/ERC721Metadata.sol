//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

//Contract for ERC721 Metadata
contract ERC721Metadata{
    string public _name;
    string public _symbol;
    constructor(string memory named,string memory symbolifield){
        _name=named;
        _symbol=symbolifield;
    }
     function name() external view returns(string memory){
        return _name;
     }
     function symbol() external view returns(string memory){
        return _symbol;
     }
}