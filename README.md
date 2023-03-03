# Storage in Solidity

Example to understand how storage in solidity works. With the example for single variable, mapping and dynamic array.

Storage in solidity can be thought of as a array of `2^256` slots. Each slot is `256 bits = 32 bytes`. Variables with size smaller than this are stored together in same slot.

For dynamic arrays, elements are stored in a contiguous manner starting from `keccak256(p)` provided `p` is the slot of the storage location of the array.

For a mapping, any element at the key `k` is stored at the location `keccak256(keccak256(k).p)` provided `p` is the slot of the storage location of the mapping. Here `a.b` represent the concatenation.  

Just copy-paste the solidity file into remix to try out.

Youtube video explaination: comming soon

Solidity Docs: [Layout of State Variables](https://docs.soliditylang.org/en/v0.8.17/internals/layout_in_storage.html) 
