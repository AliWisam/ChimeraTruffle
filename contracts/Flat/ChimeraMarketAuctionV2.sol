// SPDX-License-Identifier: MIT


pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165Upgradeable {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

// File: @openzeppelin/contracts-upgradeable/token/ERC721/IERC721Upgradeable.sol


pragma solidity >=0.6.2 <0.8.0;


/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721Upgradeable is IERC165Upgradeable {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /**
      * @dev Safely transfers `tokenId` token from `from` to `to`.
      *
      * Requirements:
      *
      * - `from` cannot be the zero address.
      * - `to` cannot be the zero address.
      * - `tokenId` token must exist and be owned by `from`.
      * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
      * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
      *
      * Emits a {Transfer} event.
      */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;
}

// File: @openzeppelin/contracts-upgradeable/math/SafeMathUpgradeable.sol


pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMathUpgradeable {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        uint256 c = a + b;
        if (c < a) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b > a) return (false, 0);
        return (true, a - b);
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) return (true, 0);
        uint256 c = a * b;
        if (c / a != b) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b == 0) return (false, 0);
        return (true, a / b);
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b == 0) return (false, 0);
        return (true, a % b);
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: division by zero");
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: modulo by zero");
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        return a - b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryDiv}.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol


pragma solidity >=0.6.2 <0.8.0;

/**
 * @dev Collection of functions related to the address type
 */
library AddressUpgradeable {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// File: @openzeppelin/contracts-upgradeable/proxy/Initializable.sol


// solhint-disable-next-line compiler-version
pragma solidity >=0.4.24 <0.8.0;


/**
 * @dev This is a base contract to aid in writing upgradeable contracts, or any kind of contract that will be deployed
 * behind a proxy. Since a proxied contract can't have a constructor, it's common to move constructor logic to an
 * external initializer function, usually called `initialize`. It then becomes necessary to protect this initializer
 * function so it can only be called once. The {initializer} modifier provided by this contract will have this effect.
 *
 * TIP: To avoid leaving the proxy in an uninitialized state, the initializer function should be called as early as
 * possible by providing the encoded function call as the `_data` argument to {UpgradeableProxy-constructor}.
 *
 * CAUTION: When used with inheritance, manual care must be taken to not invoke a parent initializer twice, or to ensure
 * that all initializers are idempotent. This is not verified automatically as constructors are by Solidity.
 */
abstract contract Initializable {

    /**
     * @dev Indicates that the contract has been initialized.
     */
    bool private _initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool private _initializing;

    /**
     * @dev Modifier to protect an initializer function from being invoked twice.
     */
    modifier initializer() {
        require(_initializing || _isConstructor() || !_initialized, "Initializable: contract is already initialized");

        bool isTopLevelCall = !_initializing;
        if (isTopLevelCall) {
            _initializing = true;
            _initialized = true;
        }

        _;

        if (isTopLevelCall) {
            _initializing = false;
        }
    }

    /// @dev Returns true if and only if the function is running in the constructor
    function _isConstructor() private view returns (bool) {
        return !AddressUpgradeable.isContract(address(this));
    }
}

// File: @openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol


pragma solidity >=0.6.0 <0.8.0;


/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract ContextUpgradeable is Initializable {
    function __Context_init() internal initializer {
        __Context_init_unchained();
    }

    function __Context_init_unchained() internal initializer {
    }
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
    uint256[50] private __gap;
}

// File: @openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol


pragma solidity >=0.6.0 <0.8.0;


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract OwnableUpgradeable is Initializable, ContextUpgradeable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    function __Ownable_init() internal initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
    }

    function __Ownable_init_unchained() internal initializer {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
    uint256[49] private __gap;
}

// File: @openzeppelin/contracts-upgradeable/utils/EnumerableSetUpgradeable.sol


pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Library for managing
 * https://en.wikipedia.org/wiki/Set_(abstract_data_type)[sets] of primitive
 * types.
 *
 * Sets have the following properties:
 *
 * - Elements are added, removed, and checked for existence in constant time
 * (O(1)).
 * - Elements are enumerated in O(n). No guarantees are made on the ordering.
 *
 * ```
 * contract Example {
 *     // Add the library methods
 *     using EnumerableSet for EnumerableSet.AddressSet;
 *
 *     // Declare a set state variable
 *     EnumerableSet.AddressSet private mySet;
 * }
 * ```
 *
 * As of v3.3.0, sets of type `bytes32` (`Bytes32Set`), `address` (`AddressSet`)
 * and `uint256` (`UintSet`) are supported.
 */
library EnumerableSetUpgradeable {
    // To implement this library for multiple types with as little code
    // repetition as possible, we write it in terms of a generic Set type with
    // bytes32 values.
    // The Set implementation uses private functions, and user-facing
    // implementations (such as AddressSet) are just wrappers around the
    // underlying Set.
    // This means that we can only create new EnumerableSets for types that fit
    // in bytes32.

    struct Set {
        // Storage of set values
        bytes32[] _values;

        // Position of the value in the `values` array, plus 1 because index 0
        // means a value is not in the set.
        mapping (bytes32 => uint256) _indexes;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function _add(Set storage set, bytes32 value) private returns (bool) {
        if (!_contains(set, value)) {
            set._values.push(value);
            // The value is stored at length-1, but we add 1 to all indexes
            // and use 0 as a sentinel value
            set._indexes[value] = set._values.length;
            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function _remove(Set storage set, bytes32 value) private returns (bool) {
        // We read and store the value's index to prevent multiple reads from the same storage slot
        uint256 valueIndex = set._indexes[value];

        if (valueIndex != 0) { // Equivalent to contains(set, value)
            // To delete an element from the _values array in O(1), we swap the element to delete with the last one in
            // the array, and then remove the last element (sometimes called as 'swap and pop').
            // This modifies the order of the array, as noted in {at}.

            uint256 toDeleteIndex = valueIndex - 1;
            uint256 lastIndex = set._values.length - 1;

            // When the value to delete is the last one, the swap operation is unnecessary. However, since this occurs
            // so rarely, we still do the swap anyway to avoid the gas cost of adding an 'if' statement.

            bytes32 lastvalue = set._values[lastIndex];

            // Move the last value to the index where the value to delete is
            set._values[toDeleteIndex] = lastvalue;
            // Update the index for the moved value
            set._indexes[lastvalue] = toDeleteIndex + 1; // All indexes are 1-based

            // Delete the slot where the moved value was stored
            set._values.pop();

            // Delete the index for the deleted slot
            delete set._indexes[value];

            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function _contains(Set storage set, bytes32 value) private view returns (bool) {
        return set._indexes[value] != 0;
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function _length(Set storage set) private view returns (uint256) {
        return set._values.length;
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function _at(Set storage set, uint256 index) private view returns (bytes32) {
        require(set._values.length > index, "EnumerableSet: index out of bounds");
        return set._values[index];
    }

    // Bytes32Set

    struct Bytes32Set {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _add(set._inner, value);
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _remove(set._inner, value);
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(Bytes32Set storage set, bytes32 value) internal view returns (bool) {
        return _contains(set._inner, value);
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(Bytes32Set storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(Bytes32Set storage set, uint256 index) internal view returns (bytes32) {
        return _at(set._inner, index);
    }

    // AddressSet

    struct AddressSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(AddressSet storage set, address value) internal returns (bool) {
        return _add(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(AddressSet storage set, address value) internal returns (bool) {
        return _remove(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(AddressSet storage set, address value) internal view returns (bool) {
        return _contains(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(AddressSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(AddressSet storage set, uint256 index) internal view returns (address) {
        return address(uint160(uint256(_at(set._inner, index))));
    }


    // UintSet

    struct UintSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(UintSet storage set, uint256 value) internal returns (bool) {
        return _add(set._inner, bytes32(value));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(UintSet storage set, uint256 value) internal returns (bool) {
        return _remove(set._inner, bytes32(value));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(UintSet storage set, uint256 value) internal view returns (bool) {
        return _contains(set._inner, bytes32(value));
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function length(UintSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(UintSet storage set, uint256 index) internal view returns (uint256) {
        return uint256(_at(set._inner, index));
    }
}

// File: @openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol


pragma solidity >=0.6.0 <0.8.0;





/**
 * @dev Contract module that allows children to implement role-based access
 * control mechanisms.
 *
 * Roles are referred to by their `bytes32` identifier. These should be exposed
 * in the external API and be unique. The best way to achieve this is by
 * using `public constant` hash digests:
 *
 * ```
 * bytes32 public constant MY_ROLE = keccak256("MY_ROLE");
 * ```
 *
 * Roles can be used to represent a set of permissions. To restrict access to a
 * function call, use {hasRole}:
 *
 * ```
 * function foo() public {
 *     require(hasRole(MY_ROLE, msg.sender));
 *     ...
 * }
 * ```
 *
 * Roles can be granted and revoked dynamically via the {grantRole} and
 * {revokeRole} functions. Each role has an associated admin role, and only
 * accounts that have a role's admin role can call {grantRole} and {revokeRole}.
 *
 * By default, the admin role for all roles is `DEFAULT_ADMIN_ROLE`, which means
 * that only accounts with this role will be able to grant or revoke other
 * roles. More complex role relationships can be created by using
 * {_setRoleAdmin}.
 *
 * WARNING: The `DEFAULT_ADMIN_ROLE` is also its own admin: it has permission to
 * grant and revoke this role. Extra precautions should be taken to secure
 * accounts that have been granted it.
 */
abstract contract AccessControlUpgradeable is Initializable, ContextUpgradeable {
    function __AccessControl_init() internal initializer {
        __Context_init_unchained();
        __AccessControl_init_unchained();
    }

    function __AccessControl_init_unchained() internal initializer {
    }
    using EnumerableSetUpgradeable for EnumerableSetUpgradeable.AddressSet;
    using AddressUpgradeable for address;

    struct RoleData {
        EnumerableSetUpgradeable.AddressSet members;
        bytes32 adminRole;
    }

    mapping (bytes32 => RoleData) private _roles;

    bytes32 public constant DEFAULT_ADMIN_ROLE = 0x00;

    /**
     * @dev Emitted when `newAdminRole` is set as ``role``'s admin role, replacing `previousAdminRole`
     *
     * `DEFAULT_ADMIN_ROLE` is the starting admin for all roles, despite
     * {RoleAdminChanged} not being emitted signaling this.
     *
     * _Available since v3.1._
     */
    event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);

    /**
     * @dev Emitted when `account` is granted `role`.
     *
     * `sender` is the account that originated the contract call, an admin role
     * bearer except when using {_setupRole}.
     */
    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);

    /**
     * @dev Emitted when `account` is revoked `role`.
     *
     * `sender` is the account that originated the contract call:
     *   - if using `revokeRole`, it is the admin role bearer
     *   - if using `renounceRole`, it is the role bearer (i.e. `account`)
     */
    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);

    /**
     * @dev Returns `true` if `account` has been granted `role`.
     */
    function hasRole(bytes32 role, address account) public view returns (bool) {
        return _roles[role].members.contains(account);
    }

    /**
     * @dev Returns the number of accounts that have `role`. Can be used
     * together with {getRoleMember} to enumerate all bearers of a role.
     */
    function getRoleMemberCount(bytes32 role) public view returns (uint256) {
        return _roles[role].members.length();
    }

    /**
     * @dev Returns one of the accounts that have `role`. `index` must be a
     * value between 0 and {getRoleMemberCount}, non-inclusive.
     *
     * Role bearers are not sorted in any particular way, and their ordering may
     * change at any point.
     *
     * WARNING: When using {getRoleMember} and {getRoleMemberCount}, make sure
     * you perform all queries on the same block. See the following
     * https://forum.openzeppelin.com/t/iterating-over-elements-on-enumerableset-in-openzeppelin-contracts/2296[forum post]
     * for more information.
     */
    function getRoleMember(bytes32 role, uint256 index) public view returns (address) {
        return _roles[role].members.at(index);
    }

    /**
     * @dev Returns the admin role that controls `role`. See {grantRole} and
     * {revokeRole}.
     *
     * To change a role's admin, use {_setRoleAdmin}.
     */
    function getRoleAdmin(bytes32 role) public view returns (bytes32) {
        return _roles[role].adminRole;
    }

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function grantRole(bytes32 role, address account) public virtual {
        require(hasRole(_roles[role].adminRole, _msgSender()), "AccessControl: sender must be an admin to grant");

        _grantRole(role, account);
    }

    /**
     * @dev Revokes `role` from `account`.
     *
     * If `account` had been granted `role`, emits a {RoleRevoked} event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function revokeRole(bytes32 role, address account) public virtual {
        require(hasRole(_roles[role].adminRole, _msgSender()), "AccessControl: sender must be an admin to revoke");

        _revokeRole(role, account);
    }

    /**
     * @dev Revokes `role` from the calling account.
     *
     * Roles are often managed via {grantRole} and {revokeRole}: this function's
     * purpose is to provide a mechanism for accounts to lose their privileges
     * if they are compromised (such as when a trusted device is misplaced).
     *
     * If the calling account had been granted `role`, emits a {RoleRevoked}
     * event.
     *
     * Requirements:
     *
     * - the caller must be `account`.
     */
    function renounceRole(bytes32 role, address account) public virtual {
        require(account == _msgSender(), "AccessControl: can only renounce roles for self");

        _revokeRole(role, account);
    }

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event. Note that unlike {grantRole}, this function doesn't perform any
     * checks on the calling account.
     *
     * [WARNING]
     * ====
     * This function should only be called from the constructor when setting
     * up the initial roles for the system.
     *
     * Using this function in any other way is effectively circumventing the admin
     * system imposed by {AccessControl}.
     * ====
     */
    function _setupRole(bytes32 role, address account) internal virtual {
        _grantRole(role, account);
    }

    /**
     * @dev Sets `adminRole` as ``role``'s admin role.
     *
     * Emits a {RoleAdminChanged} event.
     */
    function _setRoleAdmin(bytes32 role, bytes32 adminRole) internal virtual {
        emit RoleAdminChanged(role, _roles[role].adminRole, adminRole);
        _roles[role].adminRole = adminRole;
    }

    function _grantRole(bytes32 role, address account) private {
        if (_roles[role].members.add(account)) {
            emit RoleGranted(role, account, _msgSender());
        }
    }

    function _revokeRole(bytes32 role, address account) private {
        if (_roles[role].members.remove(account)) {
            emit RoleRevoked(role, account, _msgSender());
        }
    }
    uint256[49] private __gap;
}

// File: contracts/IERC721TokenCreator.sol

pragma solidity 0.6.12;

/**
 * @title IERC721 Non-Fungible Token Creator basic interface
 */
interface IERC721TokenCreator {
    /**
     * @dev Gets the creator of the token
     * @param _contractAddress address of the ERC721 contract
     * @param _tokenId uint256 ID of the token
     * @return address of the creator
     */
    function tokenCreator(address _contractAddress, uint256 _tokenId)
        external
        view
        returns (address payable);
}

// File: contracts/IERC721CreatorRoyalty.sol

pragma solidity 0.6.12;


/**
 * @title IERC721CreatorRoyalty Token level royalty interface.
 */
interface IERC721CreatorRoyalty is IERC721TokenCreator {
    /**
     * @dev Get the royalty fee percentage for a specific ERC721 contract.
     * @param _contractAddress address ERC721Contract address.
     * @param _tokenId uint256 token ID.
     * @return uint8 wei royalty fee.
     */
    function getERC721TokenRoyaltyPercentage(
        address _contractAddress,
        uint256 _tokenId
    ) external view returns (uint8);

    /**
     * @dev Utililty function to calculate the royalty fee for a token.
     * @param _contractAddress address ERC721Contract address.
     * @param _tokenId uint256 token ID.
     * @param _amount uint256 wei amount.
     * @return uint256 wei fee.
     */
    function calculateRoyaltyFee(
        address _contractAddress,
        uint256 _tokenId,
        uint256 _amount
    ) external view returns (uint256);
}

// File: contracts/IMarketplaceSettings.sol


pragma solidity 0.6.12;

/**
 * @title IMarketplaceSettings Settings governing a marketplace.
 */
interface IMarketplaceSettings {
    /////////////////////////////////////////////////////////////////////////
    // Marketplace Min and Max Values
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Get the max value to be used with the marketplace.
     * @return uint256 wei value.
     */
    function getMarketplaceMaxValue() external view returns (uint256);

    /**
     * @dev Get the max value to be used with the marketplace.
     * @return uint256 wei value.
     */
    function getMarketplaceMinValue() external view returns (uint256);

    /////////////////////////////////////////////////////////////////////////
    // Marketplace Fee
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Get the marketplace fee percentage.
     * @return uint8 wei fee.
     */
    function getMarketplaceFeePercentage() external view returns (uint8);

    /**
     * @dev Utility function for calculating the marketplace fee for given amount of wei.
     * @param _amount uint256 wei amount.
     * @return uint256 wei fee.
     */
    function calculateMarketplaceFee(uint256 _amount)
        external
        view
        returns (uint256);

    /////////////////////////////////////////////////////////////////////////
    // Primary Sale Fee
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Get the primary sale fee percentage for a specific ERC721 contract.
     * @param _contractAddress address ERC721Contract address.
     * @return uint8 wei primary sale fee.
     */
    function getERC721ContractPrimarySaleFeePercentage(address _contractAddress)
        external
        view
        returns (uint8);

    /**
     * @dev Utility function for calculating the primary sale fee for given amount of wei
     * @param _contractAddress address ERC721Contract address.
     * @param _amount uint256 wei amount.
     * @return uint256 wei fee.
     */
    function calculatePrimarySaleFee(address _contractAddress, uint256 _amount)
        external
        view
        returns (uint256);
        
        //chimera
        /////////////////////////////////////////////////////////////////////////
    // secondary Sale Fee
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Get the secondary sale fee percentage for a specific ERC721 contract.
     * @param _contractAddress address ERC721Contract address.
     * @return uint8 wei secondary sale fee.
     */
    function getERC721ContractSecondarySaleFeePercentage(address _contractAddress)
        external
        view
        returns (uint8);

    /**
     * @dev Utility function for calculating the secondary sale fee for given amount of wei
     * @param _contractAddress address ERC721Contract address.
     * @param _amount uint256 wei amount.
     * @return uint256 wei fee.
     */
    function calculateSecondarySaleFee(address _contractAddress, uint256 _amount)
        external
        view
        returns (uint256);

    /**
     * @dev Check whether the ERC721 token has sold at least once.
     * @param _contractAddress address ERC721Contract address.
     * @param _tokenId uint256 token ID.
     * @return bool of whether the token has sold.
     */
    function hasERC721TokenSold(address _contractAddress, uint256 _tokenId)
        external
        view
        returns (bool);

    /**
     * @dev Mark a token as sold.

     * Requirements:
     *
     * - `_contractAddress` cannot be the zero address.

     * @param _contractAddress address ERC721Contract address.
     * @param _tokenId uint256 token ID.
     * @param _hasSold bool of whether the token should be marked sold or not.
     */
    function markERC721Token(
        address _contractAddress,
        uint256 _tokenId,
        bool _hasSold
    ) external;
    
    
    
    
    
}

// File: @openzeppelin/contracts-upgradeable/payment/escrow/EscrowUpgradeable.sol


pragma solidity >=0.6.0 <0.8.0;





 /**
  * @title Escrow
  * @dev Base escrow contract, holds funds designated for a payee until they
  * withdraw them.
  *
  * Intended usage: This contract (and derived escrow contracts) should be a
  * standalone contract, that only interacts with the contract that instantiated
  * it. That way, it is guaranteed that all Ether will be handled according to
  * the `Escrow` rules, and there is no need to check for payable functions or
  * transfers in the inheritance tree. The contract that uses the escrow as its
  * payment method should be its owner, and provide public methods redirecting
  * to the escrow's deposit and withdraw.
  */
contract EscrowUpgradeable is Initializable, OwnableUpgradeable {
    function initialize() public virtual initializer {
        __Escrow_init();
    }
    function __Escrow_init() internal initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
        __Escrow_init_unchained();
    }

    function __Escrow_init_unchained() internal initializer {
    }
    using SafeMathUpgradeable for uint256;
    using AddressUpgradeable for address payable;

    event Deposited(address indexed payee, uint256 weiAmount);
    event Withdrawn(address indexed payee, uint256 weiAmount);

    mapping(address => uint256) private _deposits;

    function depositsOf(address payee) public view returns (uint256) {
        return _deposits[payee];
    }

    /**
     * @dev Stores the sent amount as credit to be withdrawn.
     * @param payee The destination address of the funds.
     */
    function deposit(address payee) public payable virtual onlyOwner {
        uint256 amount = msg.value;
        _deposits[payee] = _deposits[payee].add(amount);

        emit Deposited(payee, amount);
    }

    /**
     * @dev Withdraw accumulated balance for a payee, forwarding all gas to the
     * recipient.
     *
     * WARNING: Forwarding all gas opens the door to reentrancy vulnerabilities.
     * Make sure you trust the recipient, or are either following the
     * checks-effects-interactions pattern or using {ReentrancyGuard}.
     *
     * @param payee The address whose funds will be withdrawn and transferred to.
     */
    function withdraw(address payable payee) public virtual onlyOwner {
        uint256 payment = _deposits[payee];

        _deposits[payee] = 0;

        payee.sendValue(payment);

        emit Withdrawn(payee, payment);
    }
    uint256[49] private __gap;
}

// File: @openzeppelin/contracts-upgradeable/payment/PullPaymentUpgradeable.sol


pragma solidity >=0.6.2 <0.8.0;



/**
 * @dev Simple implementation of a
 * https://consensys.github.io/smart-contract-best-practices/recommendations/#favor-pull-over-push-for-external-calls[pull-payment]
 * strategy, where the paying contract doesn't interact directly with the
 * receiver account, which must withdraw its payments itself.
 *
 * Pull-payments are often considered the best practice when it comes to sending
 * Ether, security-wise. It prevents recipients from blocking execution, and
 * eliminates reentrancy concerns.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 *
 * To use, derive from the `PullPayment` contract, and use {_asyncTransfer}
 * instead of Solidity's `transfer` function. Payees can query their due
 * payments with {payments}, and retrieve them with {withdrawPayments}.
 */
abstract contract PullPaymentUpgradeable is Initializable {
    EscrowUpgradeable private _escrow;

    function __PullPayment_init() internal initializer {
        __PullPayment_init_unchained();
    }

    function __PullPayment_init_unchained() internal initializer {
        _escrow = new EscrowUpgradeable();
        _escrow.initialize();
    }

    /**
     * @dev Withdraw accumulated payments, forwarding all gas to the recipient.
     *
     * Note that _any_ account can call this function, not just the `payee`.
     * This means that contracts unaware of the `PullPayment` protocol can still
     * receive funds this way, by having a separate account call
     * {withdrawPayments}.
     *
     * WARNING: Forwarding all gas opens the door to reentrancy vulnerabilities.
     * Make sure you trust the recipient, or are either following the
     * checks-effects-interactions pattern or using {ReentrancyGuard}.
     *
     * @param payee Whose payments will be withdrawn.
     */
    function withdrawPayments(address payable payee) public virtual {
        _escrow.withdraw(payee);
    }

    /**
     * @dev Returns the payments owed to an address.
     * @param dest The creditor's address.
     */
    function payments(address dest) public view returns (uint256) {
        return _escrow.depositsOf(dest);
    }

    /**
     * @dev Called by the payer to store the sent amount as credit to be pulled.
     * Funds sent in this way are stored in an intermediate {Escrow} contract, so
     * there is no danger of them being spent before withdrawal.
     *
     * @param dest The destination address of the funds.
     * @param amount The amount to transfer.
     */
    function _asyncTransfer(address dest, uint256 amount) internal virtual {
        _escrow.deposit{ value: amount }(dest);
    }
    uint256[49] private __gap;
}

// File: contracts/ISendValueProxy.sol

pragma solidity 0.6.12;

interface ISendValueProxy {
    function sendValue(address payable _to) external payable;
}

// File: contracts/SendValueProxy.sol

pragma solidity 0.6.12;


/**
 * @dev Contract that attempts to send value to an address.
 */
contract SendValueProxy is ISendValueProxy {
    /**
     * @dev Send some wei to the address.
     * @param _to address to send some value to.
     */
    function sendValue(address payable _to) external override payable {
        // Note that `<address>.transfer` limits gas sent to receiver. It may
        // not support complex contract operations in the future.
        _to.transfer(msg.value);
    }
}

// File: contracts/MaybeSendValue.sol

pragma solidity 0.6.12;

// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/proxy/Initializable.sol';


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

// File: contracts/SendValueOrEscrow.sol

pragma solidity 0.6.12;


// import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/payment/PullPaymentUpgradeable.sol";
// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/proxy/Initializable.sol';


/**
 * @dev Contract to make payments. If a direct transfer fails, it will store the payment in escrow until the address decides to pull the payment.
 */
contract SendValueOrEscrow is MaybeSendValue, PullPaymentUpgradeable {
    /////////////////////////////////////////////////////////////////////////
    // Events
    /////////////////////////////////////////////////////////////////////////
    event SendValue(address indexed _payee, uint256 amount);
    
    //initializer
    function initialize() public  initializer {
         __PullPayment_init();
    }

    /////////////////////////////////////////////////////////////////////////
    // sendValueOrEscrow
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Send some value to an address.
     * @param _to address to send some value to.
     * @param _value uint256 amount to send.
     */
    function sendValueOrEscrow(address payable _to, uint256 _value) internal {
        // attempt to make the transfer
        bool successfulTransfer = MaybeSendValue.maybeSendValue(_to, _value);
        // if it fails, transfer it into escrow for them to redeem at their will.
        if (!successfulTransfer) {
            _asyncTransfer(_to, _value);
        }
        emit SendValue(_to, _value);
    }
}

// File: contracts/Payments.sol

pragma solidity 0.6.12;


// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/math/SafeMathUpgradeable.sol';
// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/proxy/Initializable.sol';


/**
 * @title Payments contract for Chimera Marketplaces.
 */
contract Payments is Initializable ,SendValueOrEscrow {
    using SafeMathUpgradeable for uint256;
    using SafeMathUpgradeable for uint8;
    //primaryEvents
    event PrimarymarketplacePayment(address indexed _marketplacePayee,uint indexed _marketplacePayment);
    event PrimarySalePayment(address indexed _primarySalePayee,uint primarySalePayment);
    event PrimarypayeePayment(address indexed       _payee,uint payeePayment);
    //SecondaryEvents
    event SecondarymarketplacePayment(address indexed _marketplacePayee,uint indexed _marketplacePayment);
    event SecondarySalePayment(address indexed _secondarySalePayee,uint primarySalePayment);
    event SecondarypayeePayment(address indexed       _payee,uint payeePayment);

    function initializePayment() public  initializer {
         SendValueOrEscrow.initialize();
    }



    /////////////////////////////////////////////////////////////////////////
    // refund
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function to refund an address. Typically for canceled bids or offers.
     * Requirements:
     *
     *  - _payee cannot be the zero address
     *
     * @param _marketplacePercentage uint8 percentage of the fee for the marketplace.
     * @param _amount uint256 value to be split.
     * @param _payee address seller of the token.
     */
    function refund(
        uint8 _marketplacePercentage,
        address payable _payee,
        uint256 _amount
    ) internal {
        require(
            _payee != address(0),
            "refund::no payees can be the zero address"
        );

        if (_amount > 0) {
            SendValueOrEscrow.sendValueOrEscrow(
                _payee,
                _amount.add(
                    calcPercentagePayment(_amount, _marketplacePercentage)
                )
            );
        }
    }


   /////////////////////////////////////////////////////////////////////////
    // payout Primay
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function to pay the seller, creator, and maintainer.
     * Requirements:
     *
     *  - _marketplacePercentage + _royaltyPercentage + _primarySalePercentage <= 100
     *  - no payees can be the zero address
     *
     * @param _amount uint256 value to be split.
     * @param _isPrimarySale bool of whether this is a primary sale.
     * @param _marketplacePercentage uint8 percentage of the fee for the marketplace.
     * @param _royaltyPercentage uint8 percentage of the fee for the royalty.
     * @param _primarySalePercentage uint8 percentage primary sale fee for the marketplace.
     * @param _payee address seller of the token.
     * @param _marketplacePayee address seller of the token.
     * @param _royaltyPayee address seller of the token.
     * @param _primarySalePayee address seller of the token.
     */
    function payoutPrimary(
        uint256 _amount,
        bool _isPrimarySale,
        uint8 _marketplacePercentage,
        uint8 _royaltyPercentage,
        uint8 _primarySalePercentage,
        address payable _payee,
        address payable _marketplacePayee,
        address payable _royaltyPayee,
        address payable _primarySalePayee
    ) internal {
        require(
            _marketplacePercentage <= 100,
            "payout::marketplace percentage cannot be above 100"
        );
        require(
            _royaltyPercentage.add(_primarySalePercentage) <= 100,
            "payout::percentages cannot go beyond 100"
        );
        require(
            _payee != address(0) &&
                _primarySalePayee != address(0) &&
                _marketplacePayee != address(0) &&
                _royaltyPayee != address(0),
            "payout::no payees can be the zero address"
        );

        // Note:: Solidity is kind of terrible in that there is a limit to local
        //        variables that can be put into the stack. The real pain is that
        //        one can put structs, arrays, or mappings into memory but not basic
        //        data types. Hence our payments array that stores these values.
        uint256[4] memory payments;

        // uint256 marketplacePayment
        payments[0] = calcPercentagePayment(_amount, _marketplacePercentage);

        // uint256 royaltyPayment
        payments[1] = calcRoyaltyPayment(
            _isPrimarySale,
            _amount,
            _royaltyPercentage
        );

        // uint256 primarySalePayment
        payments[2] = calcPrimarySalePayment(
            _isPrimarySale,
            _amount,
            _primarySalePercentage
        );

        // uint256 payeePayment
        // payments[3] = _amount.sub(payments[2]);
        payments[3] = _amount.sub(payments[1]).sub(payments[2]);

        // marketplacePayment
        if (payments[0] > 0) {
            SendValueOrEscrow.sendValueOrEscrow(_marketplacePayee, payments[0]);
            emit PrimarymarketplacePayment(_marketplacePayee,payments[0]);
        }

        // royaltyPayment
         if (payments[1] > 0) {
            SendValueOrEscrow.sendValueOrEscrow(_royaltyPayee, payments[1]);
        }
        // primarySalePayment
        if (payments[2] > 0) {
            SendValueOrEscrow.sendValueOrEscrow(_primarySalePayee, payments[2]);
            emit PrimarySalePayment(_primarySalePayee, payments[2]);
        }
        // payeePayment
        if (payments[3] > 0) {
            SendValueOrEscrow.sendValueOrEscrow(_payee, payments[3]);
            emit PrimarypayeePayment(_payee, payments[3]);
        }
    }
    
    /////////////////////////////////////////////////////////////////////////
    // payout With Secondary Fee
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function to pay the seller, creator, and maintainer.
     * Requirements:
     *
     *  - _marketplacePercentage + _royaltyPercentage + _secondarySalePercentage <= 100
     *  - no payees can be the zero address
     *
     * @param _amount uint256 value to be split.
     * @param _isPrimarySale bool of whether this is a primary sale.
     * @param _marketplacePercentage uint8 percentage of the fee for the marketplace.
     * @param _royaltyPercentage uint8 percentage of the fee for the royalty.
     * @param _secondarySalePercentage uint8 percentage primary sale fee for the marketplace.
     * @param _payee address seller of the token.
     * @param _marketplacePayee address seller of the token.
     * @param _royaltyPayee address seller of the token.
     * @param _secondarySalePayee address seller of the token.
     */
    function payoutSecondary(
        uint256 _amount,
        bool _isPrimarySale, //false
        uint8 _marketplacePercentage,
        uint8 _royaltyPercentage,
        uint8 _secondarySalePercentage,
        address payable _payee,
        address payable _marketplacePayee,
        address payable _royaltyPayee,
        address payable _secondarySalePayee
    ) internal {
        require(
            _marketplacePercentage <= 100,
            "payout::marketplace percentage cannot be above 100"
        );
        require(
            _royaltyPercentage.add(_secondarySalePercentage) <= 100,
            "payout::percentages cannot go beyond 100"
        );
        require(
            _payee != address(0) &&
                _secondarySalePayee != address(0) &&
                _marketplacePayee != address(0) &&
                _royaltyPayee != address(0),
            "payout::no payees can be the zero address"
        );

        // Note:: Solidity is kind of terrible in that there is a limit to local
        //        variables that can be put into the stack. The real pain is that
        //        one can put structs, arrays, or mappings into memory but not basic
        //        data types. Hence our payments array that stores these values.
        uint256[4] memory payments;

        // uint256 marketplacePayment
        payments[0] = calcPercentagePayment(_amount, _marketplacePercentage);

        // uint256 royaltyPayment
        payments[1] = calcRoyaltyPayment(
            _isPrimarySale,
            _amount,
            _royaltyPercentage
        );

        // uint256 SecondarySalePayment
        payments[2] = calcSecondarySalePayment(
            _isPrimarySale,
            _amount,
            _secondarySalePercentage
        );

        // uint256 payeePayment
        //payments[3] = _amount.sub(payments[2]);
         payments[3] = _amount.sub(payments[1]).sub(payments[2]);

        // marketplacePayment
        if (payments[0] > 0) {
            SendValueOrEscrow.sendValueOrEscrow(_marketplacePayee, payments[0]);
            emit SecondarymarketplacePayment(_marketplacePayee,payments[0] );
        }

        // // royaltyPayment
        if (payments[1] > 0) {
            SendValueOrEscrow.sendValueOrEscrow(_royaltyPayee, payments[1]);
        }
        // primarySalePayment
        if (payments[2] > 0) {
            SendValueOrEscrow.sendValueOrEscrow(_secondarySalePayee, payments[2]);
            emit SecondarySalePayment(_secondarySalePayee, payments[2]);
        }
        // payeePayment
        if (payments[3] > 0) {
            SendValueOrEscrow.sendValueOrEscrow(_payee, payments[3]);
            emit SecondarypayeePayment(_payee,payments[3]);
        }
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////
    // calcRoyaltyPayment
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Private function to calculate Royalty amount.
     *      If primary sale: 0
     *      If no royalty percentage: 0
     *      otherwise: royalty in wei
     * @param _isPrimarySale bool of whether this is a primary sale
     * @param _amount uint256 value to be split
     * @param _percentage uint8 royalty percentage
     * @return uint256 wei value owed for royalty
     */
    function calcRoyaltyPayment(
        bool _isPrimarySale,
        uint256 _amount,
        uint8 _percentage
    ) private pure returns (uint256) {
        if (_isPrimarySale) {
            return 0;
        }
        return calcPercentagePayment(_amount, _percentage);
    }

    /////////////////////////////////////////////////////////////////////////
    // calcPrimarySalePayment
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Private function to calculate PrimarySale amount.
     *      If not primary sale: 0
     *      otherwise: primary sale in wei
     * @param _isPrimarySale bool of whether this is a primary sale
     * @param _amount uint256 value to be split
     * @param _percentage uint8 royalty percentage
     * @return uint256 wei value owed for primary sale
     */
    function calcPrimarySalePayment(
        bool _isPrimarySale,
        uint256 _amount,
        uint8 _percentage
    ) private pure returns (uint256) {
        if (_isPrimarySale) {
            return calcPercentagePayment(_amount, _percentage);
        }
        return 0;
    }
    
        /////////////////////////////////////////////////////////////////////////
    // calcSecondarySalePayment
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Private function to calculate PrimarySale amount.
     *      If not primary sale: 0
     *      otherwise: primary sale in wei
     * @param _isPrimarySale bool of whether this is a primary sale
     * @param _amount uint256 value to be split
     * @param _percentage uint8 royalty percentage
     * @return uint256 wei value owed for primary sale
     */
    function calcSecondarySalePayment(
        bool _isPrimarySale,
        uint256 _amount,
        uint8 _percentage
    ) private pure returns (uint256) {
        if (!_isPrimarySale) {
            return calcPercentagePayment(_amount, _percentage);
        }
        return 0;
    }
    /////////////////////////////////////////////////////////////////////////
    // calcPercentagePayment
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function to calculate percentage value.
     * @param _amount uint256 wei value
     * @param _percentage uint8  percentage
     * @return uint256 wei value based on percentage.
     */
    function calcPercentagePayment(uint256 _amount, uint8 _percentage)
        internal
        pure
        returns (uint256)
    {
        return _amount.mul(_percentage).div(100);
    }
}

// File: contracts/ChimeraMarketAuctionV2.sol

pragma solidity 0.6.12;





// import "https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/token/ERC721/IERC721Upgradeable.sol";
// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/math/SafeMathUpgradeable.sol';
// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/access/OwnableUpgradeable.sol';
// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/access/AccessControlUpgradeable.sol';
// import 'https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v3.3/contracts/proxy/Initializable.sol';





contract ChimeraMarketAuctionV2 is Initializable, OwnableUpgradeable, AccessControlUpgradeable ,Payments {
    using SafeMathUpgradeable for uint256;

    /////////////////////////////////////////////////////////////////////////
    // Structs
    /////////////////////////////////////////////////////////////////////////

    // The active bid for a given token, contains the bidder, the marketplace fee at the time of the bid, and the amount of wei placed on the token
    struct ActiveBid {
        address payable bidder;
        uint8 marketplaceFee;
        uint256 amount;
    }

    // The sale price for a given token containing the seller and the amount of wei to be sold for
    struct SalePrice {
        address payable seller;
        uint256 amount;
    }
    
    /////////////////////////////////////////////////////////////////////////
    // Constants
    /////////////////////////////////////////////////////////////////////////
        
    bytes32 public constant TOKEN_COLLECTOR_ROLE = "TOKEN_COLLECTOR_ROLE";
    
    /////////////////////////////////////////////////////////////////////////
    // State Variables
    /////////////////////////////////////////////////////////////////////////

    // Marketplace Settings Interface
    IMarketplaceSettings public iMarketplaceSettings;

    // Creator Royalty Interface
    IERC721CreatorRoyalty public iERC721CreatorRoyalty;

    // Mapping from ERC721 contract to mapping of tokenId to sale price.
    mapping(address => mapping(uint256 => SalePrice)) private tokenPrices;

    // Mapping of ERC721 contract to mapping of token ID to the current bid amount.
    mapping(address => mapping(uint256 => ActiveBid)) private tokenCurrentBids;

    // A minimum increase in bid amount when out bidding someone.
    uint8 public minimumBidIncreasePercentage; // 10 = 10%
    

        mapping(uint256 => bool) private TokenConfirmedByAdmin;
    
    function confirmTokenByAdmin(uint256 _tokenId, address _originContract) onlyOwner external{
         IERC721Upgradeable erc721 = IERC721Upgradeable(_originContract);
         address tokenOwner = erc721.ownerOf(_tokenId);
         require(tokenOwner != address(0), "confirmTokenByAdmin: token not exists");
         TokenConfirmedByAdmin[_tokenId]  = true;
         
         
    }
    function isTokenConfirmedByAdmin(uint256 _tokenId) public view returns(bool){
        return TokenConfirmedByAdmin[_tokenId]; 
    }

    /////////////////////////////////////////////////////////////////////////////
    // Events
    /////////////////////////////////////////////////////////////////////////////
    event Sold(
        address indexed _originContract,
        address indexed _buyer,
        address indexed _seller,
        uint256 _amount,
        uint256 _tokenId
    );

    event SetSalePrice(
        address indexed _originContract,
        uint256 _amount,
        uint256 _tokenId
    );

    event Bid(
        address indexed _originContract,
        address indexed _bidder,
        uint256 _amount,
        uint256 _tokenId
    );

    event AcceptBid(
        address indexed _originContract,
        address indexed _bidder,
        address indexed _seller,
        uint256 _amount,
        uint256 _tokenId
    );

    event CancelBid(
        address indexed _originContract,
        address indexed _bidder,
        uint256 _amount,
        uint256 _tokenId
    );
    event collectorRoleGrantedTo(
        address _collector
        );
        
    event collectorRoleRevokedTo(
        address _collector
        );
    /////////////////////////////////////////////////////////////////////////
    // initialize
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Initializes the contract setting the market settings and creator royalty interfaces.
     * @param _iMarketSettings address to set as iMarketplaceSettings.
     * @param _iERC721CreatorRoyalty address to set as iERC721CreatorRoyalty.
     */
    function initialize(address _iMarketSettings, address _iERC721CreatorRoyalty) public initializer {
        require(
        _iMarketSettings != address(0),
        "constructor::Cannot have null address for _iMarketSettings"
        );

        require(
            _iERC721CreatorRoyalty != address(0),
            "constructor::Cannot have null address for _iERC721CreatorRoyalty"
        );
        __Ownable_init();
        __AccessControl_init();
        Payments.initializePayment();
        
        // Grant the contract deployer the default admin role: it will be able
        // to grant and revoke any roles
        _setupRole(AccessControlUpgradeable.DEFAULT_ADMIN_ROLE, owner());
        // Set iMarketSettings
        iMarketplaceSettings = IMarketplaceSettings(_iMarketSettings);

        // Set iERC721CreatorRoyalty
        iERC721CreatorRoyalty = IERC721CreatorRoyalty(_iERC721CreatorRoyalty);
        
        minimumBidIncreasePercentage = 10;
    }
    
    //Grant Role to Collectors
    
    function grantCollectorRole(address _collector) onlyOwner private {
     
        grantRole(TOKEN_COLLECTOR_ROLE, _collector);
        
        emit collectorRoleGrantedTo(_collector);
    }
    
    //revoke roles
    function revokeCollectorRole(address _collector) onlyOwner private{
        revokeRole(TOKEN_COLLECTOR_ROLE, _collector);
        
        emit collectorRoleRevokedTo(_collector);
    }
    
    /////////////////////////////////////////////////////////////////////////
    // setIMarketplaceSettings
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Admin function to set the marketplace settings.
     * Rules:
     * - only owner
     * - _address != address(0)
     * @param _address address of the IMarketplaceSettings.
     */
    function setMarketplaceSettings(address _address) public onlyOwner {
        require(
            _address != address(0),
            "setMarketplaceSettings::Cannot have null address for _iMarketSettings"
        );

        iMarketplaceSettings = IMarketplaceSettings(_address);
    }

    /////////////////////////////////////////////////////////////////////////
    // setIERC721CreatorRoyalty
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Admin function to set the IERC721CreatorRoyalty.
     * Rules:
     * - only owner
     * - _address != address(0)
     * @param _address address of the IERC721CreatorRoyalty.
     */
    function setIERC721CreatorRoyalty(address _address) public onlyOwner {
        require(
            _address != address(0),
            "setIERC721CreatorRoyalty::Cannot have null address for _iERC721CreatorRoyalty"
        );

        iERC721CreatorRoyalty = IERC721CreatorRoyalty(_address);
    }

    /////////////////////////////////////////////////////////////////////////
    // setMinimumBidIncreasePercentage
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Admin function to set the minimum bid increase percentage.
     * Rules:
     * - only owner
     * @param _percentage uint8 to set as the new percentage.
     */
    function setMinimumBidIncreasePercentage(uint8 _percentage)
        public
        onlyOwner
    {
        minimumBidIncreasePercentage = _percentage;
    }

    /////////////////////////////////////////////////////////////////////////
    // Modifiers (as functions)
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Checks that the token owner is approved for the ERC721Market
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token
     */
    function ownerMustHaveMarketplaceApproved(
        address _originContract,
        uint256 _tokenId
    ) internal view {
        IERC721Upgradeable erc721 = IERC721Upgradeable(_originContract);
        address owner = erc721.ownerOf(_tokenId);
        require(
            erc721.isApprovedForAll(owner, address(this)),
            "owner must have approved contract"
        );
    }

    /**
     * @dev Checks that the token is owned by the sender
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token
     */
    function senderMustBeTokenOwner(address _originContract, uint256 _tokenId)
        internal
        view
    {
        IERC721Upgradeable erc721 = IERC721Upgradeable(_originContract);
        require(
            erc721.ownerOf(_tokenId) == msg.sender,
            "sender must be the token owner"
        );
    }

    /////////////////////////////////////////////////////////////////////////
    // setSalePrice
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Set the token for sale. The owner of the token must be the sender and have the marketplace approved.
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token
     * @param _amount uint256 wei value that the item is for sale
     */
    function setSalePrice(
        address _originContract,
        uint256 _tokenId,
        uint256 _amount
    ) external {
        
        // The owner of the token must have the marketplace approved
        ownerMustHaveMarketplaceApproved(_originContract, _tokenId);
        
        // The sender must be the token owner
        senderMustBeTokenOwner(_originContract, _tokenId);
        
        require(isTokenConfirmedByAdmin(_tokenId) == true, "Token not confirmed by admin to trade");

        if (_amount == 0) {
            // Set not for sale and exit
            _resetTokenPrice(_originContract, _tokenId);
            emit SetSalePrice(_originContract, _amount, _tokenId);
            return;
        }

        tokenPrices[_originContract][_tokenId] = SalePrice(msg.sender, _amount);
        emit SetSalePrice(_originContract, _amount, _tokenId);
    }
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Purchase the token with the expected amount. The current token owner must have the marketplace approved.
     * @param _originContract address of the contract storing the token.

    /////////////////////////////////////////////////////////////////////////
    // safeBuy
     * @param _tokenId uint256 ID of the token
     * @param _amount uint256 wei amount expecting to purchase the token for.
     */
    function safeBuy(
        address _originContract,
        uint256 _tokenId,
        uint256 _amount
    ) external payable {
        
        // Make sure the tokenPrice is the expected amount
        require(
            tokenPrices[_originContract][_tokenId].amount == _amount,
            "safeBuy::Purchase amount must equal expected amount"
        );
        buy(_originContract, _tokenId);
    }

/////////////////////////////////////////////////////////////////////////
    // buy
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Purchases the token if it is for sale.
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token.
     */
    function buy(address _originContract, uint256 _tokenId) public payable {
        require(hasRole(TOKEN_COLLECTOR_ROLE, msg.sender), "You are not allowed to collect Art");
        // The owner of the token must have the marketplace approved
        ownerMustHaveMarketplaceApproved(_originContract, _tokenId);

        // Check that the person who set the price still owns the token.
        require(
            _priceSetterStillOwnsTheToken(_originContract, _tokenId),
            "buy::Current token owner must be the person to have the latest price."
        );

        SalePrice memory sp = tokenPrices[_originContract][_tokenId];

        // Check that token is for sale.
        require(sp.amount > 0, "buy::Tokens priced at 0 are not for sale.");

        // Check that enough ether was sent.
        require(
            tokenPriceFeeIncluded(_originContract, _tokenId) == msg.value,
            "buy::Must purchase the token for the correct price(buy)"
        );

        // Get token contract details.
        IERC721Upgradeable erc721 = IERC721Upgradeable(_originContract);
        address tokenOwner = erc721.ownerOf(_tokenId);

        // Wipe the token price.
        _resetTokenPrice(_originContract, _tokenId);

        // Transfer token.
        erc721.safeTransferFrom(tokenOwner, msg.sender, _tokenId);

        // if the buyer had an existing bid, return it
        if (_addressHasBidOnToken(msg.sender, _originContract, _tokenId)) {
            _refundBid(_originContract, _tokenId);
        }
        //Made 2 types of Payments in Payments.sol Primary and secondary
        // Payout all parties.
        address payable owner = _makePayable(owner());
        if(!iMarketplaceSettings.hasERC721TokenSold(_originContract, _tokenId)){
            Payments.payoutPrimary(
            sp.amount,
            !iMarketplaceSettings.hasERC721TokenSold(_originContract, _tokenId),
            iMarketplaceSettings.getMarketplaceFeePercentage(),
            iERC721CreatorRoyalty.getERC721TokenRoyaltyPercentage(
                _originContract,
                _tokenId
            ),
            iMarketplaceSettings.getERC721ContractPrimarySaleFeePercentage(
                _originContract
            ),
            _makePayable(tokenOwner),
            owner,
            iERC721CreatorRoyalty.tokenCreator(_originContract, _tokenId),
            owner
        );

        // Set token as sold
        iMarketplaceSettings.markERC721Token(_originContract, _tokenId, true);

        emit Sold(_originContract, msg.sender, tokenOwner, sp.amount, _tokenId);
        }
        else{
            Payments.payoutSecondary(
            sp.amount,
            !iMarketplaceSettings.hasERC721TokenSold(_originContract, _tokenId),
            iMarketplaceSettings.getMarketplaceFeePercentage(),
            iERC721CreatorRoyalty.getERC721TokenRoyaltyPercentage(
                _originContract,
                _tokenId
            ),
            iMarketplaceSettings.getERC721ContractSecondarySaleFeePercentage(
                _originContract
            ),
            _makePayable(tokenOwner),
            owner,
            iERC721CreatorRoyalty.tokenCreator(_originContract, _tokenId),
            owner
        );

        // Set token as sold
        iMarketplaceSettings.markERC721Token(_originContract, _tokenId, true);

        emit Sold(_originContract, msg.sender, tokenOwner, sp.amount, _tokenId);
        }
        
    }

    /////////////////////////////////////////////////////////////////////////
    // tokenPrice
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Gets the sale price of the token
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token
     * @return uint256 sale price of the token
     */
    function tokenPrice(address _originContract, uint256 _tokenId)
        external
        view
        returns (uint256)
    {
        // The owner of the token must have the marketplace approved
        ownerMustHaveMarketplaceApproved(_originContract, _tokenId); // TODO: Make sure to write test to verify that this returns 0 when it fails

        if (_priceSetterStillOwnsTheToken(_originContract, _tokenId)) {
            return tokenPrices[_originContract][_tokenId].amount;
        }
        return 0;
    }

    /////////////////////////////////////////////////////////////////////////
    // tokenPriceFeeIncluded
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Gets the sale price of the token including the marketplace fee.
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token
     * @return uint256 sale price of the token including the fee.
     */
    function tokenPriceFeeIncluded(address _originContract, uint256 _tokenId)
        public
        view
        returns (uint256)
    {
        // The owner of the token must have the marketplace approved
        ownerMustHaveMarketplaceApproved(_originContract, _tokenId); // TODO: Make sure to write test to verify that this returns 0 when it fails

        if (_priceSetterStillOwnsTheToken(_originContract, _tokenId)) {
            return
                tokenPrices[_originContract][_tokenId].amount.add(
                    iMarketplaceSettings.calculateMarketplaceFee(
                        tokenPrices[_originContract][_tokenId].amount
                    )
                );
        }
        return 0;
    }

    /////////////////////////////////////////////////////////////////////////
    // bid
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Bids on the token, replacing the bid if the bid is higher than the current bid. You cannot bid on a token you already own.
     * @param _newBidAmount uint256 value in wei to bid.
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token
     */
    function bid(
        uint256 _newBidAmount,
        address _originContract,
        uint256 _tokenId
    ) external payable {
        require(hasRole(TOKEN_COLLECTOR_ROLE, msg.sender), "You are not allowed to collect Art");
        // Check that bid is greater than 0.
        require(_newBidAmount > 0, "bid::Cannot bid 0 Wei.");

        // Check that bid is higher than previous bid
        uint256 currentBidAmount =
            tokenCurrentBids[_originContract][_tokenId].amount;
        require(
            _newBidAmount > currentBidAmount &&
                _newBidAmount >=
                currentBidAmount.add(
                    currentBidAmount.mul(minimumBidIncreasePercentage).div(100)
                ),
            "bid::Must place higher bid than existing bid + minimum percentage."
        );

        // Check that enough ether was sent.
        uint256 requiredCost =
            _newBidAmount.add(
                iMarketplaceSettings.calculateMarketplaceFee(_newBidAmount)
            );
        require(
            requiredCost == msg.value,
            "bid::Must purchase the token for the correct price."
        );

        // Check that bidder is not owner.
        IERC721Upgradeable erc721 = IERC721Upgradeable(_originContract);
        address tokenOwner = erc721.ownerOf(_tokenId);
        require(tokenOwner != msg.sender, "bid::Bidder cannot be owner.");

        // Refund previous bidder.
        _refundBid(_originContract, _tokenId);

        // Set the new bid.
        _setBid(_newBidAmount, msg.sender, _originContract, _tokenId);

        emit Bid(_originContract, msg.sender, _newBidAmount, _tokenId);
    }

    /////////////////////////////////////////////////////////////////////////
    // safeAcceptBid
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Accept the bid on the token with the expected bid amount.
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token
     * @param _amount uint256 wei amount of the bid
     */
    function safeAcceptBid(
        address _originContract,
        uint256 _tokenId,
        uint256 _amount
    ) external {
        // Make sure accepting bid is the expected amount
        require(
            tokenCurrentBids[_originContract][_tokenId].amount == _amount,
            "safeAcceptBid::Bid amount must equal expected amount"
        );
        acceptBid(_originContract, _tokenId);
    }

 /////////////////////////////////////////////////////////////////////////
    // acceptBid
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Accept the bid on the token.
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token
     */
    function acceptBid(address _originContract, uint256 _tokenId) public {
        // The owner of the token must have the marketplace approved
        ownerMustHaveMarketplaceApproved(_originContract, _tokenId);

        // The sender must be the token owner
        senderMustBeTokenOwner(_originContract, _tokenId);

        // Check that a bid exists.
        require(
            _tokenHasBid(_originContract, _tokenId),
            "acceptBid::Cannot accept a bid when there is none."
        );

        // Get current bid on token

        ActiveBid memory currentBid =
            tokenCurrentBids[_originContract][_tokenId];

        // Wipe the token price and bid.
        _resetTokenPrice(_originContract, _tokenId);
        _resetBid(_originContract, _tokenId);

        // Transfer token.
        IERC721Upgradeable erc721 = IERC721Upgradeable(_originContract);
        erc721.safeTransferFrom(msg.sender, currentBid.bidder, _tokenId);

        // Payout all parties.
        address payable owner = _makePayable(owner());
        
        if(!iMarketplaceSettings.hasERC721TokenSold(_originContract, _tokenId)){
            
        Payments.payoutPrimary(
            currentBid.amount,
            !iMarketplaceSettings.hasERC721TokenSold(_originContract, _tokenId),
            iMarketplaceSettings.getMarketplaceFeePercentage(),
            iERC721CreatorRoyalty.getERC721TokenRoyaltyPercentage(
                _originContract,
                _tokenId
            ),
            iMarketplaceSettings.getERC721ContractPrimarySaleFeePercentage(
                _originContract
            ),
            msg.sender,
            owner,
            iERC721CreatorRoyalty.tokenCreator(_originContract, _tokenId),
            owner
        );

        iMarketplaceSettings.markERC721Token(_originContract, _tokenId, true);

        emit AcceptBid(
            _originContract,
            currentBid.bidder,
            msg.sender,
            currentBid.amount,
            _tokenId
        );
            
        }
       else{
            Payments.payoutSecondary(
            currentBid.amount,
            !iMarketplaceSettings.hasERC721TokenSold(_originContract, _tokenId),
            iMarketplaceSettings.getMarketplaceFeePercentage(),
            iERC721CreatorRoyalty.getERC721TokenRoyaltyPercentage(
                _originContract,
                _tokenId
            ),
            iMarketplaceSettings.getERC721ContractSecondarySaleFeePercentage(
                _originContract
            ),
            msg.sender,
            owner,
            iERC721CreatorRoyalty.tokenCreator(_originContract, _tokenId),
            owner
        );

        iMarketplaceSettings.markERC721Token(_originContract, _tokenId, true);

        emit AcceptBid(
            _originContract,
            currentBid.bidder,
            msg.sender,
            currentBid.amount,
            _tokenId
        );
       }
    }
    

    /////////////////////////////////////////////////////////////////////////
    // cancelBid
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Cancel the bid on the token.
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 ID of the token.
     */
    function cancelBid(address _originContract, uint256 _tokenId) external {
        // Check that sender has a current bid.
        require(
            _addressHasBidOnToken(msg.sender, _originContract, _tokenId),
            "cancelBid::Cannot cancel a bid if sender hasn't made one."
        );

        // Refund the bidder.
        _refundBid(_originContract, _tokenId);

        emit CancelBid(
            _originContract,
            msg.sender,
            tokenCurrentBids[_originContract][_tokenId].amount,
            _tokenId
        );
    }

    /////////////////////////////////////////////////////////////////////////
    // currentBidDetailsOfToken
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Function to get current bid and bidder of a token.
     * @param _originContract address of ERC721 contract.
     * @param _tokenId uin256 id of the token.
     */
    function currentBidDetailsOfToken(address _originContract, uint256 _tokenId)
        public
        view
        returns (uint256, address)
    {
        return (
            tokenCurrentBids[_originContract][_tokenId].amount,
            tokenCurrentBids[_originContract][_tokenId].bidder
        );
    }

    /////////////////////////////////////////////////////////////////////////
    // _priceSetterStillOwnsTheToken
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Checks that the token is owned by the same person who set the sale price.
     * @param _originContract address of the contract storing the token.
     * @param _tokenId uint256 id of the.
     */
    function _priceSetterStillOwnsTheToken(
        address _originContract,
        uint256 _tokenId
    ) internal view returns (bool) {
        IERC721Upgradeable erc721 = IERC721Upgradeable(_originContract);
        return
            erc721.ownerOf(_tokenId) ==
            tokenPrices[_originContract][_tokenId].seller;
    }

    /////////////////////////////////////////////////////////////////////////
    // _resetTokenPrice
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function to set token price to 0 for a given contract.
     * @param _originContract address of ERC721 contract.
     * @param _tokenId uin256 id of the token.
     */
    function _resetTokenPrice(address _originContract, uint256 _tokenId)
        internal
    {
        tokenPrices[_originContract][_tokenId] = SalePrice(address(0), 0);
    }

    /////////////////////////////////////////////////////////////////////////
    // _addressHasBidOnToken
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function see if the given address has an existing bid on a token.
     * @param _bidder address that may have a current bid.
     * @param _originContract address of ERC721 contract.
     * @param _tokenId uin256 id of the token.
     */
    function _addressHasBidOnToken(
        address _bidder,
        address _originContract,
        uint256 _tokenId
    ) internal view returns (bool) {
        return tokenCurrentBids[_originContract][_tokenId].bidder == _bidder;
    }

    /////////////////////////////////////////////////////////////////////////
    // _tokenHasBid
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function see if the token has an existing bid.
     * @param _originContract address of ERC721 contract.
     * @param _tokenId uin256 id of the token.
     */
    function _tokenHasBid(address _originContract, uint256 _tokenId)
        internal
        view
        returns (bool)
    {
        return tokenCurrentBids[_originContract][_tokenId].bidder != address(0);
    }

    /////////////////////////////////////////////////////////////////////////
    // _refundBid
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function to return an existing bid on a token to the
     *      bidder and reset bid.
     * @param _originContract address of ERC721 contract.
     * @param _tokenId uin256 id of the token.
     */
    function _refundBid(address _originContract, uint256 _tokenId) internal {
        ActiveBid memory currentBid =
            tokenCurrentBids[_originContract][_tokenId];
        if (currentBid.bidder == address(0)) {
            return;
        }
        _resetBid(_originContract, _tokenId);
        Payments.refund(
            currentBid.marketplaceFee,
            currentBid.bidder,
            currentBid.amount
        );
    }

    /////////////////////////////////////////////////////////////////////////
    // _resetBid
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function to reset bid by setting bidder and bid to 0.
     * @param _originContract address of ERC721 contract.
     * @param _tokenId uin256 id of the token.
     */
    function _resetBid(address _originContract, uint256 _tokenId) internal {
        tokenCurrentBids[_originContract][_tokenId] = ActiveBid(
            address(0),
            0,
            0
        );
    }

    /////////////////////////////////////////////////////////////////////////
    // _setBid
    /////////////////////////////////////////////////////////////////////////
    /**
     * @dev Internal function to set a bid.
     * @param _amount uint256 value in wei to bid. Does not include marketplace fee.
     * @param _bidder address of the bidder.
     * @param _originContract address of ERC721 contract.
     * @param _tokenId uin256 id of the token.
     */
    function _setBid(
        uint256 _amount,
        address payable _bidder,
        address _originContract,
        uint256 _tokenId
    ) internal {
        // Check bidder not 0 address.
        require(_bidder != address(0), "Bidder cannot be 0 address.");

        // Set bid.
        tokenCurrentBids[_originContract][_tokenId] = ActiveBid(
            _bidder,
            iMarketplaceSettings.getMarketplaceFeePercentage(),
            _amount
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
