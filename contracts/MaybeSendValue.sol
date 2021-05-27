// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;


import '@openzeppelin/contracts-upgradeable/proxy/Initializable.sol';
// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/proxy/Initializable.sol';
import "./SendValueProxy.sol";

/**
 * @dev Contract with a ISendValueProxy that will catch reverts when attempting to transfer funds.
 */
contract MaybeSendValue is Initializable {
    SendValueProxy proxy;

    // constructor() internal {
    //     proxy = new SendValueProxy();
    // }

     function SendValueProxyInitialize() public initializer {
        proxy = new SendValueProxy();
    }

    /**
     * @dev Maybe send some wei to the address via a proxy. Returns true on success and false if transfer fails.
     * @param _to address to send some value to.
     * @param _value uint256 amount to send.
     */
    // function maybeSendValue(address payable _to, uint256 _value)
    //     internal
    //     returns (bool)
    // {
    //     // Call sendValue on the proxy contract and forward the mesg.value.
    //     /* solium-disable-next-line */
    //     // (bool success, bytes memory _) = address(proxy).call.value(_value)(
    //     //     abi.encodeWithSignature("sendValue(address)", _to)
    //     // );
    //     (bool success, bytes memory _) = address(proxy).call{value:(_value)}(
    //         abi.encodeWithSignature("sendValue(address)", _to)
    //     );
    //     return success;
    // }
    
    /**
     * @dev Maybe send some wei to the address via a proxy. Returns true on success and false if transfer fails.
     * @param _to address to send some value to.
     * @param _value uint256 amount to send.
     */
    function maybeSendValue(address payable _to, uint256 _value)
        internal
        returns (bool)
    {

        _to.transfer(_value);
        
        return true;
    }

}
