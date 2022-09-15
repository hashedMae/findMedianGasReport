// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin/utils/math/Math.sol";

contract MedianSorted {
    uint256[] sorted;
    uint256[] unsorted;

    

    function findMedian(uint256[] memory sorted_) external returns(uint256 median) {
        median = _findMedian(sorted_);
    }


    function sort(uint256[] memory unsorted_) public returns(uint256[] memory sorted_) {
        sorted_ = _sort(unsorted_);
    }

    
    function _sort(uint256[] memory unsorted_) internal returns(uint256[] memory) {
        
        
        uint256 _currentSmallest;
        uint256 _smallestIndex;
        uint256 _loops = unsorted_.length;

        for(uint k = 0; k < unsorted_.length; ++k) {
            unsorted.push(unsorted_[k]);
        }

        for(uint256 i =0; i < _loops;) {
            for(uint256 j = 0; j < unsorted.length;) {
                if(j == 0){
                    _currentSmallest = unsorted[j];
                    _smallestIndex = j;
                } else if(_isSmaller(unsorted[j], _currentSmallest)) {
                    _currentSmallest = unsorted[j];
                    _smallestIndex = j;
                }
                unchecked{++j;}
            }
            sorted.push(_currentSmallest);
            unsorted[_smallestIndex] = unsorted[unsorted.length -1];
            unsorted.pop();
            unchecked{++i;}
        }
        return sorted;
    }    

    function _isSmaller(uint256 toCompare, uint256 currentSmallest) internal pure returns(bool answer) {
        answer = (toCompare < currentSmallest);
    }

    function _isEven(uint256 x) internal pure returns(bool answer) {
        uint256 remainder = x % 2;
        if(remainder == 0){
            answer = true;
        }
        return answer;
    }

    function _findMedian(uint256[] memory sorted_) internal  returns(uint256 median) {
        uint256 length = sorted_.length;
        if(_isEven(length)) {
            uint256 b = length / 2;
            uint256 a = b - 1;
            median = (sorted_[a] + sorted_[b])/2;
        } else {
            uint256 a = length / 2;
            median = sorted_[a];
        }
    }
}
