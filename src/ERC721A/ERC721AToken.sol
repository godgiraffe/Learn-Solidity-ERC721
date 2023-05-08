// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IERC721A.sol";
import "./ERC721A.sol";

contract ERC721AToken is ERC721A {

    constructor(string memory name, string memory symbol)
      ERC721A(name, symbol)  // 因為 ERC-721A 需要 constructor, 所以要在這邊傳參數給它用
    {

    }

    function mint(address _to, uint256 _quantity) external {
      _safeMint(_to, _quantity);
    }
}