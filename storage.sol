// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2;

contract Storage {
    uint256 number; // slot 0
    mapping(uint256 => uint256) map; // slot 1
    uint256[] arr; // slot 2

    // Store functions
    function store(uint256 num) public {
        number = num;
    }

    function storeInMap(uint256 key, uint256 val) public {
        map[key] = val;
    }

    function storeToArr(uint256 num) public {
        arr.push(num);
    }

    // Retrieve functions
    function retrieve() public view returns (uint256) {
        return number;
    }

    function retrieveFromMap(uint256 key) public view returns (uint256) {
        return map[key];
    }

    function retrieveFromArr(uint256 key) public view returns (uint256) {
        return arr[key];
    }

    // For dynamic arrays, elements are stored in a contiguous manner, starting from `keccak256(slotOfArr)` 
    // In our case `slotOfArr = 2`
    // This will return the slot of 1st element in the array
    function slotForArrItems(
        uint256 slotOfArr
    ) public pure returns (uint256 slot) {
        return uint256(keccak256(abi.encode(slotOfArr))); 
    }

    // For a mapping, any element at the key `k` is stored at the location `keccak256(keccak256(k).slotOfMap)`
    // In our case `slotOfMap = 1`
    function slotForMapItems(
        uint256 key,
        uint256 slotOfMap
    ) public pure returns (uint256 slot) {
        return uint256(keccak256(abi.encode(key, slotOfMap)));
    }

    // Loads the content of the storage location,
    // using the assembly instruction `sload`
    // In our case you can pass the slot returned by `slotForArrItems` and `slotForMapItems`
    function sload(uint256 slot) public view returns (bytes32 value) {
        assembly {
            value := sload(slot)
        }
    }
}
