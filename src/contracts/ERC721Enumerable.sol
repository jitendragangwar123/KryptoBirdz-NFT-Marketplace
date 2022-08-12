//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import './ERC721.sol';

contract ERC721Enumerable is ERC721{
    uint[] private _allTokens;

    //mapping from tokeID to positions of _allTokens Array
    mapping(uint=> uint) private _allTokensIndex;
    //mapping of owner to list of all owner token ids
    mapping(address=>uint[]) private _ownedTokens;
    //mapping from tokenID index of the owner token list
    mapping(uint=>uint) private _ownedTokensIndex;

    
    function tokenByIndex(uint index) public view returns(uint){
        require(index<totalSupply(),"Global Index out of bounds!");
        return _allTokens[index];
    }

    function tokenOfOwnerByIndex(address owner,uint index) public view returns(uint){
        require(index<balanceOf(owner),"Owner Index out of bounds!");
        return _ownedTokens[owner][index];

    }
    function _mint(address to,uint tokenID) internal override(ERC721){
        super._mint(to,tokenID);
        _addTokensToAllTokenEnumeration(tokenID);
        _addTokensToOwnerEnumeration(to, tokenID);
    }
    
    //add tokens to _allTokens array and set the postions of index
    function _addTokensToAllTokenEnumeration(uint tokenID) private {
        _allTokensIndex[tokenID]=_allTokens.length;
        _allTokens.push(tokenID);
    }
    
    function _addTokensToOwnerEnumeration(address to,uint tokenID) private {
        _ownedTokensIndex[tokenID]=_ownedTokens[to].length;
        _ownedTokens[to].push(tokenID);

    }

    //return the total supply of the _allTokens array
    function totalSupply() public view returns(uint){
        return _allTokens.length;
    }

}