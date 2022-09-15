// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MedianVsMean.sol";

contract CounterTest is Test {
    MedianVsMean public mVm;

    uint256 max = 2**256-1;

    function setUp() public {
       mVm = new MedianVsMean();
    }

    function testIsSorted(uint256 w, uint256 x, uint256 y, uint256 z) public {
        vm.assume(w > 0);
        vm.assume(x > 0);
        vm.assume(x != w);
        vm.assume(y > 0);
        vm.assume(y != x && y != w);
        vm.assume(z > 0);
        vm.assume(z != y && z != w && z != x);
        uint256[] memory sorted = mVm.sort(x, y, w, z);
        assertLt(sorted[0], sorted[1]);
        assertLt(sorted[1], sorted[2]);
        assertLt(sorted[2], sorted[3]);
    }

    
}
