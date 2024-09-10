// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Merkle} from "murky/src/Merkle.sol";

contract Whitelist {

    Merkle merkle = new Merkle;
    bytes32 public merkleRoot;

    constructor(bytes32 _merkleRoot) {
        merkleRoot = _merkleRoot;
    }

    function chechInWhitelist(bytes32 [] calldata proof, uint64 maxAllowanceToMint) view public returns (bool) {
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender, maxAllowanceToMint));

        bool newVerified = m.verifyProof(merkleRoot, proof, leaf);
        return newVerified;

    }
 
}
