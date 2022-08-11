//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract ERC721{
   
   //create a event 
    event Transfer(address indexed from,
                 address indexed to,
                 uint indexed tokenID);

    //mapping from tokenID to the owner
    mapping(uint=>address) private _tokenOwner;
    //mapping from owner to number of owned tokens
    mapping(address=>uint) private _OwnedTokenCount;

    function _exists(uint tokenID) internal view returns(bool){
        //setting address of nft owner to check the mapping of address 
        //from tokenOwner at the tokenID
        address owner=_tokenOwner[tokenID];
        return owner!=address(0);
    }
    // minting function
    function _mint(address to,uint tokenID) internal {
        //require that the address is not zero.
        require(to!=address(0),"ERC721: minting to the zero address.");
        //require that the token does not already exist.
        require(!_exists(tokenID),"ERC721: Token already exist.");
        //we are adding a new address with tokenID for minting
        _tokenOwner[tokenID]=to;
        //keep track the each address that is minting and adding the count 1
        _OwnedTokenCount[to]+=1;

        emit Transfer(address(0), to,tokenID);
    }
}