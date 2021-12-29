// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract VitalikPunks is ERC721, ERC721Enumerable {
    using Counters for Counters.Counter;

    Counters.Counter private _idCounter;
    uint256 public maxSupply;

    constructor () ERC721 ("VitalikPunks", "VTLKS") {
        maxSupply = _maxSupply;
    }
    function mint() public{
        uint256 current = _idCounter.current();
        require(current< maxSupply, "No VitalikPunks left:(");
        _safeMint(msg.sender, tokenId);
        _tokenId.increment();

    }

    function tokenURI(uint256, tokenId) 
        public
        view 
        override
        returns (string memory)
     {

         require(
             _exists(tokenId),
             "ERC721 Metadata: URI query for non existent token"
         );

         string memory jsonURI = abi.encodePacked(
             
             '{"name": "VitalikPunks #',
             tokenId,
             '","description": "Vitalik Punks are randomized Avatars stored on chain to teach Dapps development on Vitalik","image":"' 
             "// TODO: Calculate image URL",
             '"}'

             
             
             
             );
    }



    // override required 

function _beforeTokenTransfer(address from, address to, uint256 tokenId)
    internal
    override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);

    }
    function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721, ERC721Enumerable)
    returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}