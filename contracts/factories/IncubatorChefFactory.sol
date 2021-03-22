// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.6.12;

import '@openzeppelin/contracts/access/Ownable.sol';
import "../interfaces/IMintable.sol";
import "../IncubatorChef.sol";
import "../interfaces/IIncubatorChefFactory.sol";

contract IncubatorChefFactory is IIncubatorChefFactory, Ownable {

    function createNewIncubatorChef(
        uint256 layerId,
        IMintable kswap,
        address devaddr,
        address feeAddress,
        uint256 kswapPerBlock,
        uint256 startBlock
    ) override external onlyOwner returns (IIncubatorChef){
        IncubatorChef chef = new IncubatorChef{salt : bytes32(layerId)}(
            kswap,
            devaddr,
            feeAddress,
            kswapPerBlock,
            startBlock
        );
        Ownable(chef).transferOwnership(msg.sender);
        return chef;
    }

}
