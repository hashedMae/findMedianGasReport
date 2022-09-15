// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MedianUnsorted.sol";
import "../src/MedianSorted.sol";

contract MedianTest is Test {
    MedianUnsorted  medianU;
    MedianSorted medianS;
    uint256 max = 2**256-1;
    uint256[] unsorted;

    function setUp() public {
       medianU = new MedianUnsorted();
       medianS = new MedianSorted();
    }

    function testIsSorted(uint256 w, uint256 x, uint256 y, uint256 z) public {
        vm.assume(w > 0);
        vm.assume(x > 0);
        vm.assume(x != w);
        vm.assume(y > 0);
        vm.assume(y != x && y != w);
        vm.assume(z > 0);
        vm.assume(z != y && z != w && z != x);
        unsorted.push(x);
        unsorted.push(z);
        unsorted.push(y);
        unsorted.push(w);

        uint256[] memory unsorted_ = unsorted;
        uint256[] memory sorted = medianU.sort(unsorted_);
        assertLt(sorted[0], sorted[1]);
        assertLt(sorted[1], sorted[2]);
        assertLt(sorted[2], sorted[3]);
        assertEq(unsorted_.length, sorted.length);
    }

    function testMedianUnsorted2(uint128 v, uint128 w) public {
        vm.assume(v > 0);
        vm.assume(w > 0 && w != v);

        unsorted.push(uint256(v));
        unsorted.push(uint256(w));

        uint256[] memory unsorted_ = unsorted;
        

        uint256 answer = (uint256(v) + uint256(w)) / 2;
        uint256 _median = medianU.findMedian(unsorted_);

        assertEq(answer, _median);
    }

    function testMedianUnsorted3(uint256 v, uint256 w, uint256 x) public {
        vm.assume(v > 0);
        vm.assume(w > 0 && w != v);
        vm.assume(x > 0 && x != w && x != v);

        unsorted.push(v);
        unsorted.push(w);
        unsorted.push(x);

        uint256[] memory unsorted_ = unsorted;

        uint256[] memory sorted = medianS.sort(unsorted_);
        uint256 answer = sorted[1];
        uint256 _median = medianU.findMedian(sorted);
        assertEq(answer, _median);
    }

    function testMedianUnsorted4(uint128 v, uint128 w, uint128 x, uint128 y) public {
        vm.assume(v > 0);
        vm.assume(w > 0 && w != v);
        vm.assume(x > 0 && x != w && x != v);
        vm.assume(y > 0 && y != x && y != w && y != v);

        unsorted.push(uint256(v));
        unsorted.push(uint256(w));
        unsorted.push(uint256(x));
        unsorted.push(uint256(y));

        uint256[] memory unsorted_ = unsorted;
        uint256[] memory sorted = medianS.sort(unsorted_);
        uint256 median_ = medianU.findMedian(sorted);
        uint256 answer = (sorted[1] + sorted[2]) / 2;
        assertEq(answer, median_);
    }

    function testMedianUnsorted5(uint128 v, uint128 w, uint128 x, uint128 y, uint128 z) public {
        vm.assume(v > 0);
        vm.assume(w > 0 && w != v);
        vm.assume(x > 0 && x != w && x != v);
        vm.assume(y > 0 && y != x && y != w && y != v);
        vm.assume(z > 0);

        unsorted.push(uint256(v));
        unsorted.push(uint256(w));
        unsorted.push(uint256(x));
        unsorted.push(uint256(y));
        unsorted.push(uint256(z));

        uint256[] memory unsorted_ = unsorted;
        uint256[] memory sorted = medianS.sort(unsorted_);
        uint256 median_ = medianU.findMedian(sorted);
        uint256 answer = sorted[2];
        console.log(sorted[2]);
        assertEq(answer, median_);
    }

    function testMedianSorted2(uint128 v, uint128 w) public {
        vm.assume(v > 0);
        vm.assume(w > 0 && w != v);

        unsorted.push(uint256(v));
        unsorted.push(uint256(w));

        uint256[] memory unsorted_ = unsorted;
        uint256[] memory sorted = medianS.sort(unsorted_);

        uint256 answer = (uint256(v) + uint256(w)) / 2;
        uint256 _median = medianS.findMedian(sorted);

        assertEq(answer, _median);
    }

    function testMedianSorted3(uint256 v, uint256 w, uint256 x) public {
        vm.assume(v > 0);
        vm.assume(w > 0 && w != v);
        vm.assume(x > 0 && x != w && x != v);

        unsorted.push(v);
        unsorted.push(w);
        unsorted.push(x);

        uint256[] memory unsorted_ = unsorted;
        

        uint256[] memory sorted = medianS.sort(unsorted_);
        uint256 answer = sorted[1];
        uint256 _median = medianS.findMedian(sorted);
        assertEq(answer, _median);
    }

    function testMedianSorted4(uint128 v, uint128 w, uint128 x, uint128 y) public {
        vm.assume(v > 0);
        vm.assume(w > 0 && w != v);
        vm.assume(x > 0 && x != w && x != v);
        vm.assume(y > 0 && y != x && y != w && y != v);

        unsorted.push(uint256(v));
        unsorted.push(uint256(w));
        unsorted.push(uint256(x));
        unsorted.push(uint256(y));

        uint256[] memory unsorted_ = unsorted;
        uint256[] memory sorted = medianS.sort(unsorted_);
        uint256 median_ = medianS.findMedian(sorted);
        uint256 answer = (sorted[1] + sorted[2]) / 2;
        assertEq(answer, median_);
    }

    function testMedianSorted5(uint128 v, uint128 w, uint128 x, uint128 y, uint128 z) public {
        vm.assume(v > 0);
        vm.assume(w > 0 && w != v);
        vm.assume(x > 0 && x != w && x != v);
        vm.assume(y > 0 && y != x && y != w && y != v);
        vm.assume(z > 0);

        unsorted.push(uint256(v));
        unsorted.push(uint256(w));
        unsorted.push(uint256(x));
        unsorted.push(uint256(y));
        unsorted.push(uint256(z));

        uint256[] memory unsorted_ = unsorted;
        uint256[] memory sorted = medianS.sort(unsorted_);
        uint256 median_ = medianS.findMedian(sorted);
        uint256 answer = sorted[2];
        assertEq(answer, median_);
    }
}

    

