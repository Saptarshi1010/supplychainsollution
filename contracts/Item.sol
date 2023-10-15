// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./ItemManager.sol";

contract item {
    uint public PriceinWei;
    uint public ItemIndex;
    uint public Pricepaid;

    ItemManager parentContract;

    constructor(
        ItemManager _parentContract,
        uint _PriceinWei,
        uint _ItemIndex
    ) {
        parentContract = _parentContract;
        PriceinWei = _PriceinWei;
        ItemIndex = _ItemIndex;
    }

    receive() external payable {
        require(Pricepaid == 0, "paid item is already in supply chain");
        require(PriceinWei == msg.value, "Please give the correct amount");
        (bool success, ) = address(parentContract).call{value: msg.value}(
            abi.encodeWithSignature("makePayment(uint256)", ItemIndex)
        );
        Pricepaid = msg.value;
        require(success, "Transection is failed, cancelling");
    }

    fallback() external {}
}
