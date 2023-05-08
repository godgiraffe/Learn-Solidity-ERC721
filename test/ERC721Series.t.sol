// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ERC721/ERC721Token.sol";
import "../src/ERC721A/ERC721AToken.sol";

contract ERC721Series is Test {
  // 嘗試用 test case 比較 Enumerable 和 ERC721A 的各個 function
  // mint
  // transfer
  // approve

  ERC721Token EToken;
  ERC721AToken AToken;
  address Alice;
  address Bob;
  address Arthur;

  function setUp() public {
    Alice = makeAddr("Alice");
    Bob = makeAddr("Bob");
    Arthur = makeAddr("Arthur");

    EToken = new ERC721Token("Lost Land", "LL");
    AToken = new ERC721AToken("Goodbye Garbage", "GG");
  }
  // === [ Single Mint ] ===
  function test721SingleMint() public {
    mint721(Alice, 1);
  }

  function test721ASingleMint() public {
    mint721A(Bob, 1);
  }


  // === [ Multi Mint ] ===
  function test721MultiMint() public {
    mint721(Alice, 3);
  }

  function test721AMultiMint() public {
    mint721A(Bob, 3);
  }

  // === [ Single Approve ] ===
  function test721Approve() public {
    mint721(Alice, 1);
    vm.startPrank(Alice);
    EToken.approve(Arthur, 1);
    vm.stopPrank();
  }

  function test721AApprove() public {
    mint721A(Alice, 1);
    vm.startPrank(Alice);
    AToken.approve(Arthur, 0);
    vm.stopPrank();

    // function approve(address to, uint256 tokenId) external payable;
  }

  // === [ ApprovalForAll ] ===
  function test721setApprovalForAll() public {
    mint721(Alice, 3);
    vm.startPrank(Alice);
    EToken.setApprovalForAll(Arthur, true);
    vm.stopPrank();
  }

  function test721AsetApprovalForAll() public {
    mint721A(Alice, 3);
    vm.startPrank(Alice);
    AToken.setApprovalForAll(Arthur, true);
    vm.stopPrank();
  }

  // transfer
  function test721Transfer() public {
  }




  function mint721(address user, uint256 amount) public {
    vm.startPrank(user);
    for (uint256 i = 1; i <= amount; ++i) {
      EToken.mint(user, i);
    }
    vm.stopPrank();
  }

  function mint721A(address user, uint256 amount) public {
    vm.startPrank(user);
    AToken.mint(user, amount);
    vm.stopPrank();
  }

}
