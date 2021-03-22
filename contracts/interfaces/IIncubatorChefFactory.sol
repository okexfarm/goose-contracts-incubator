// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.6.12;

import "../libs/IBEP20.sol";
import "./IMintable.sol";
import "./IIncubatorChef.sol";

interface IIncubatorChefFactory{
    function createNewIncubatorChef(
        uint256 layerId,
        IMintable kswap,
        address devaddr,
        address feeAddress,
        uint256 kswapPerBlock,
        uint256 startBlock
    ) external returns (IIncubatorChef);
}
