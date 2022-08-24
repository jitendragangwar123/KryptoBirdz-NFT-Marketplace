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

    //mapping from tokenID to the owner
    mapping(uint=>address) private _tokenApprovals;

    function balanceOf(address _owner) public view returns(uint){
        require(_owner!=address(0),"Owner query for non-existent token");
        return _OwnedTokenCount[_owner];
    }

    function ownerOf(uint _tokenId) public view returns(address){
        address owner=_tokenOwner[_tokenId];
        require(owner!=address(0),"Owner query for non-existent token");
        return owner;

    }

    function _exists(uint tokenID) internal view returns(bool){
        //setting address of nft owner to check the mapping of address 
        //from tokenOwner at the tokenID
        address owner=_tokenOwner[tokenID];
        return owner!=address(0);
    }
    // minting function
    function _mint(address to,uint tokenID) internal virtual {
        //require that the address is not zero.
        require(to!=address(0),"ERC721: minting to the zero address.");
        //require that the token does not already exist.
        require(!_exists(tokenID),"ERC721: Token already exist.");
        //we are adding a new address with tokenID for minting
        _tokenOwner[tokenID]=to;
        //keep track the each address that is minting and adding the count 1
        _OwnedTokenCount[to]+=1;

        emit Transfer(address(0),to,tokenID);
    }

    function transferFrom(address _from,address _to,uint _tokenID) external payable{
        require(address(0)!=_to,"Error-ERC721 transfer from to the zero address!");
        require(ownerOf(_tokenID)==_from,"Trying to transfer the token from address does not own!");
        _OwnedTokenCount[_to]+=1;
        _OwnedTokenCount[_from]-=1;
        _tokenOwner[_tokenID]=_to;
    }
}