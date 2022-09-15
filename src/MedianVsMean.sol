// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MedianVsMean {
    uint256[] unsorted;
    uint256[] sorted;

    function _findMedian(uint256[] memory sorted) external returns(uint256 median) {
        uint256 length = sorted.length;
        if(_isEven(length)) {
            uint256 a = length / 2;
            uint256 b = a + 1;
            median = (a+b)/2;
        }
        
    }

    function findMedian2(uint256 x, uint256 y) external returns(uint256[] memory) {
        
    }


    function sort(uint256 w, uint256 x, uint256 y, uint256 z) external returns(uint256[] memory) {
        
        unsorted.push(w);
        unsorted.push(x);
        unsorted.push(y);
        unsorted.push(z);
        
        return _sortUint(unsorted);
    }

    
    function _sortUint(uint256[] storage _unsorted) internal returns(uint256[] memory) {
        uint256 _currentSmallest;
        uint256 _smallestIndex;
        uint256 _loops = _unsorted.length;

        for(uint256 i =0; i < _loops;) {
            for(uint256 j = 0; j < _unsorted.length;) {
                if(j == 0){
                    _currentSmallest = _unsorted[j];
                    _smallestIndex = j;
                } else if(_isSmaller(_unsorted[j], _currentSmallest)) {
                    _currentSmallest = _unsorted[j];
                    _smallestIndex = j;
                }
                unchecked{++j;}
            }
            sorted.push(_currentSmallest);
            _unsorted[_smallestIndex] = _unsorted[_unsorted.length -1];
            _unsorted.pop();
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
}
