pragma solidity 0.6.12;

import '@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol';
import '@openzeppelin/contracts-upgradeable/proxy/Initializable.sol';
// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/access/OwnableUpgradeable.sol';
// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/proxy/Initializable.sol';
import "./ChimeraMarketAuctionV2.sol";

contract TestExpensiveWallet is OwnableUpgradeable {
    
    function initialize() public initializer { 
        __Ownable_init();
    }
    /**
     * @dev A costly payment method. Should fail on `<address>.transfer`
     */
    receive() external payable {
        uint256 a = 0;
        while (a < 1500000) {
            a = a + 1;
        }
        _makePayable(owner()).transfer(msg.value);
    }

    /**
     * @dev Claim the money as the owner.
     * @param _escrowAddress address of the contract escrowing the money to be claimed
     */
    function claimMoney(address _escrowAddress) external onlyOwner {
        ChimeraMarketAuctionV2(_escrowAddress).withdrawPayments(
            _makePayable(address(this))
        );
    }

    /**
     * @dev Place a bid for the owner
     * @param _newBidAmount uint256 value in wei to bid, plus marketplace fee.
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token
     * @param _market address of the marketplace to make the bid
     */
    function bid(
        uint256 _newBidAmount,
        address _originContract,
        uint256 _tokenId,
        address _market
    ) public payable {
        ChimeraMarketAuctionV2(_market).bid{value: msg.value}(
            _newBidAmount,
            _originContract,
            _tokenId
        );
    }

    /////////////////////////////////////////////////////////////////////////
    // _makePayable
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function to set a bid.
     * @param _address non-payable address
     * @return payable address
     */
    function _makePayable(address _address)
        internal
        pure
        returns (address payable)
    {
        return address(uint160(_address));
    }
}
