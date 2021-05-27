// contracts/MyContract.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import '@openzeppelin/contracts-upgradeable/proxy/Initializable.sol';
import '@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol';
import '@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol';
import '@openzeppelin/contracts-upgradeable/math/SafeMathUpgradeable.sol';

// import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/access/OwnableUpgradeable.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/proxy/Initializable.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/token/ERC721/ERC721Upgradeable.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/math/SafeMathUpgradeable.sol";
// last contract inheritance
//contract Chimera is Initializable, ERC721Upgradeable, IERC721Creator, Ownable, Whitelist 

  contract Whitelist is Initializable, OwnableUpgradeable {
      
       function initialize() public initializer {
         __Ownable_init();
          }
      
    // Mapping of address to boolean indicating whether the address is whitelisted
    mapping(address => bool) private whitelistMap;

    // flag controlling whether whitelist is enabled.
    bool private whitelistEnabled = true;

    event AddToWhitelist(address indexed _newAddress);
    event RemoveFromWhitelist(address indexed _removedAddress);

    /**
   * @dev Enable or disable the whitelist
   * @param _enabled bool of whether to enable the whitelist.
   */
    function enableWhitelist(bool _enabled) public onlyOwner {
        whitelistEnabled = _enabled;
    }

    /**
   * @dev Adds the provided address to the whitelist
   * @param _newAddress address to be added to the whitelist
   */
    function addToWhitelist(address _newAddress) public onlyOwner {
        _whitelist(_newAddress);
        
        emit AddToWhitelist(_newAddress);
    }

    /**
   * @dev Removes the provided address to the whitelist
   * @param _removedAddress address to be removed from the whitelist
   */
    function removeFromWhitelist(address _removedAddress) public onlyOwner {
        _unWhitelist(_removedAddress);
        emit RemoveFromWhitelist(_removedAddress);
    }

    /**
   * @dev Returns whether the address is whitelisted
   * @param _address address to check
   * @return bool
   */
    function isWhitelisted(address _address) public view returns (bool) {
        if (whitelistEnabled) {
            return whitelistMap[_address];
        } else {
            return true;
        }
    }

    /**
   * @dev Internal function for removing an address from the whitelist
   * @param _removedAddress address to unwhitelisted
   */
    function _unWhitelist(address _removedAddress) internal {
        whitelistMap[_removedAddress] = false;
    }

    /**
   * @dev Internal function for adding the provided address to the whitelist
   * @param _newAddress address to be added to the whitelist
   */
    function _whitelist(address _newAddress) internal {
        whitelistMap[_newAddress] = true;
    }
}
contract Chimera is Initializable, ERC721Upgradeable, OwnableUpgradeable, Whitelist {
    using SafeMathUpgradeable for uint256;
    
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    // Mapping from token ID to the creator's address.
    mapping(uint256 => address) private tokenCreators;
    
    //Enum for storing token type whether it is physical or Digital
    enum TokenType {DIGITAL,PHYSICAL}
    //Enum for storing token sale type PRIMARY or SECONDARY
    enum TokenSaleType {PRIMARY,SECONDARY}
    
    struct tokenTypeStruct{
    TokenType tokenType;
    TokenSaleType tokensaleType;
      
    }
     
    //mapping to hold token Type 
    mapping(uint256 => tokenTypeStruct) private tokentypes;
    
    
    
    // Counter for creating token IDs
    uint256 private idCounter;
    
    // Event indicating metadata was updated.
    event TokenURIUpdated(uint256 indexed _tokenId, string  _uri, TokenType _tokenType);

    function initialize(string memory name, string memory symbol)  public initializer {
        //ERC721Upgradeable.__ERC721_init(name , symbol);
        Whitelist.initialize();
        __Ownable_init();
        __ERC721_init(name , symbol);
        
    }

    /**
     * @dev Whitelists a bunch of addresses.
     * @param _whitelistees address[] of addresses to whitelist.
     */
    function initWhitelist(address[] memory _whitelistees) public onlyOwner {
      // Add all whitelistees.
      for (uint256 i = 0; i < _whitelistees.length; i++) {
        address creator = _whitelistees[i];
        if (!isWhitelisted(creator)) {
          _whitelist(creator);
        }
      }
      
    }

    /**
     * @dev Checks that the token is owned by the sender.
     * @param _tokenId uint256 ID of the token.
     */
    modifier onlyTokenOwner(uint256 _tokenId) {
      address owner = ownerOf(_tokenId);
      require(owner == msg.sender, "must be the owner of the token");
      _;
    }

    /**
     * @dev Checks that the token was created by the sender.
     * @param _tokenId uint256 ID of the token.
     */
    modifier onlyTokenCreator(uint256 _tokenId) {
      address creator = tokenCreator(_tokenId);
      require(creator == msg.sender, "must be the creator of the token");
      _;
    }

    /**
     * @dev Adds a new unique token to the supply.
     * @param _uri string metadata uri associated with the token.
     * param _tokenType of the token to make it PHYSICAL or DIGITAL
     */
    function addNewToken(string memory _uri, TokenType _tokenType) public {
      require(isWhitelisted(msg.sender), "must be whitelisted to create tokens");
      _createToken(_uri, msg.sender, _tokenType);
    }

    /**
     * @dev Deletes the token with the provided ID.
     * @param _tokenId uint256 ID of the token.
    //  */
    function deleteToken(uint256 _tokenId) public onlyTokenOwner(_tokenId) {
      _burn( _tokenId);
    }

    /**
     * @dev Updates the token metadata if the owner is also the
     *      creator.
     * @param _tokenId uint256 ID of the token.
     * @param _uri string metadata URI.
     * param _tokenType of the token PHYSICAL or DIGITAL 0,1
     */
    function updateTokenMetadata(uint256 _tokenId, string memory _uri,TokenType _tokenType  )
      public
      onlyTokenOwner(_tokenId)
      onlyTokenCreator(_tokenId)
    {
      _setTokenURI(_tokenId, _uri);
      _setTokenType(_tokenId,_tokenType);
      
      emit TokenURIUpdated(_tokenId, _uri, _tokenType);
    }

    /**
    * @dev Gets the creator of the token.
    * @param _tokenId uint256 ID of the token.
    * @return address of the creator.
    */
    function tokenCreator(uint256 _tokenId) public view returns (address) {
        return tokenCreators[_tokenId];
    }
    
      /**
    * @dev Gets the Type of the token.
    * @param _tokenId uint256 ID of the token.
    * @return _tokentype of the token PHYSICAL or DIGITAL.
    */
    function tokenType(uint256 _tokenId) public view returns (TokenType _tokentype) {
        return  tokentypes[_tokenId].tokenType;
    }
      /**
    * @dev Gets the Sale Type of the token.
    * @param _tokenId uint256 ID of the token.
    * @return _tokensaleType of the token PHYSICAL or DIGITAL.
    */
    function getTokenSaleType(uint256 _tokenId) public view returns (TokenSaleType _tokensaleType) {
        return  tokentypes[_tokenId].tokensaleType;
    }
    

    /**
     * @dev Internal function for setting the token's creator.
     * @param _tokenId uint256 id of the token.
     * @param _creator address of the creator of the token.
     */
    function _setTokenCreator(uint256 _tokenId, address _creator) internal {
      tokenCreators[_tokenId] = _creator;
    }
     /**
     * @dev Internal function for setting the token Type.
     * @param _tokenId uint256 id of the token.
     * @param _tokenType 0,1 DIGITAL,PHYSICAL of the creator of the token.
     */
    function _setTokenType(uint256 _tokenId, TokenType _tokenType ) internal{
        tokentypes[_tokenId].tokenType = _tokenType;
    }
    
    // function _setTokenSaleType(uint256 _tokenId ) internal returns(TokenSaleType _tokensaleType){
    //     TokenSaleType tokensaleType = TokenSaleType.PRIMARY;
    //     tokentypes[_tokenId].tokensaleType = tokensaleType;
        
    //     return tokentypes[_tokenId].tokensaleType;
    // }
    /**
     * @dev Internal function creating a new token.
     * @param _uri string metadata uri associated with the token
     * @param _creator address of the creator of the token.
     * @param _tokenType of the token
     */
    function _createToken(string memory _uri, address _creator,TokenType _tokenType  ) internal returns (uint256) {
      uint256 newId = idCounter;
      idCounter++;
      _mint(_creator, newId);
      _setTokenURI(newId, _uri);
      _setTokenCreator(newId, _creator);
      _setTokenType(newId,_tokenType);
      
      return newId;
    }
    
    

    
    
    
}