# Report


## Gas Optimizations


| |Issue|Instances|
|-|:-|:-:|
| [GAS-1](#GAS-1) | Using bools for storage incurs overhead | 1 |
| [GAS-2](#GAS-2) | For Operations that will not overflow, you could use unchecked | 136 |
| [GAS-3](#GAS-3) | Don't initialize variables with default value | 1 |
| [GAS-4](#GAS-4) | Functions guaranteed to revert when called by normal users can be marked `payable` | 21 |
| [GAS-5](#GAS-5) | Using `private` rather than `public` for constants, saves gas | 9 |
### <a name="GAS-1"></a>[GAS-1] Using bools for storage incurs overhead
Use uint256(1) and uint256(2) for true/false to avoid a Gwarmaccess (100 gas), and to avoid Gsset (20000 gas) when changing from ‘false’ to ‘true’, after having been ‘true’ in the past. See [source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27).

*Instances (1)*:
```solidity
File: src/LRTConfig.sol

15:     mapping(address token => bool isSupported) public isSupportedAsset;

```

### <a name="GAS-2"></a>[GAS-2] For Operations that will not overflow, you could use unchecked

*Instances (136)*:
```solidity
File: src/LRTConfig.sol

4: import { UtilLib } from "./utils/UtilLib.sol";

4: import { UtilLib } from "./utils/UtilLib.sol";

5: import { LRTConstants } from "./utils/LRTConstants.sol";

5: import { LRTConstants } from "./utils/LRTConstants.sol";

6: import { ILRTConfig } from "./interfaces/ILRTConfig.sol";

6: import { ILRTConfig } from "./interfaces/ILRTConfig.sol";

8: import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

8: import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

8: import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

8: import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

```

```solidity
File: src/LRTDepositPool.sol

4: import { UtilLib } from "./utils/UtilLib.sol";

4: import { UtilLib } from "./utils/UtilLib.sol";

5: import { LRTConstants } from "./utils/LRTConstants.sol";

5: import { LRTConstants } from "./utils/LRTConstants.sol";

7: import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";

7: import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";

8: import { IRSETH } from "./interfaces/IRSETH.sol";

8: import { IRSETH } from "./interfaces/IRSETH.sol";

9: import { ILRTOracle } from "./interfaces/ILRTOracle.sol";

9: import { ILRTOracle } from "./interfaces/ILRTOracle.sol";

10: import { INodeDelegator } from "./interfaces/INodeDelegator.sol";

10: import { INodeDelegator } from "./interfaces/INodeDelegator.sol";

11: import { ILRTDepositPool } from "./interfaces/ILRTDepositPool.sol";

11: import { ILRTDepositPool } from "./interfaces/ILRTDepositPool.sol";

13: import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

13: import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

13: import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

13: import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

14: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

14: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

14: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

14: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

15: import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";

15: import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";

15: import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";

15: import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";

50:         return (assetLyingInDepositPool + assetLyingInNDCs + assetStakedInEigenLayer);

50:         return (assetLyingInDepositPool + assetLyingInNDCs + assetStakedInEigenLayer);

57:         return lrtConfig.depositLimitByAsset(asset) - getTotalAssetDeposits(asset);

83:             assetLyingInNDCs += IERC20(asset).balanceOf(nodeDelegatorQueue[i]);

84:             assetStakedInEigenLayer += INodeDelegator(nodeDelegatorQueue[i]).getAssetBalance(asset);

86:                 ++i;

86:                 ++i;

109:         rsethAmountToMint = (amount * lrtOracle.getAssetPrice(asset)) / lrtOracle.getRSETHPrice();

109:         rsethAmountToMint = (amount * lrtOracle.getAssetPrice(asset)) / lrtOracle.getRSETHPrice();

164:         if (nodeDelegatorQueue.length + length > maxNodeDelegatorCount) {

173:                 ++i;

173:                 ++i;

```

```solidity
File: src/LRTOracle.sol

4: import { UtilLib } from "./utils/UtilLib.sol";

4: import { UtilLib } from "./utils/UtilLib.sol";

5: import { LRTConstants } from "./utils/LRTConstants.sol";

5: import { LRTConstants } from "./utils/LRTConstants.sol";

6: import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";

6: import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";

8: import { IRSETH } from "./interfaces/IRSETH.sol";

8: import { IRSETH } from "./interfaces/IRSETH.sol";

9: import { IPriceFetcher } from "./interfaces/IPriceFetcher.sol";

9: import { IPriceFetcher } from "./interfaces/IPriceFetcher.sol";

10: import { ILRTOracle } from "./interfaces/ILRTOracle.sol";

10: import { ILRTOracle } from "./interfaces/ILRTOracle.sol";

11: import { ILRTDepositPool } from "./interfaces/ILRTDepositPool.sol";

11: import { ILRTDepositPool } from "./interfaces/ILRTDepositPool.sol";

12: import { INodeDelegator } from "./interfaces/INodeDelegator.sol";

12: import { INodeDelegator } from "./interfaces/INodeDelegator.sol";

14: import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";

14: import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";

14: import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";

15: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

15: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

15: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

15: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

71:             totalETHInPool += totalAssetAmt * assetER;

71:             totalETHInPool += totalAssetAmt * assetER;

74:                 ++asset_idx;

74:                 ++asset_idx;

78:         return totalETHInPool / rsEthSupply;

```

```solidity
File: src/NodeDelegator.sol

4: import { UtilLib } from "./utils/UtilLib.sol";

4: import { UtilLib } from "./utils/UtilLib.sol";

5: import { LRTConstants } from "./utils/LRTConstants.sol";

5: import { LRTConstants } from "./utils/LRTConstants.sol";

6: import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";

6: import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";

8: import { INodeDelegator } from "./interfaces/INodeDelegator.sol";

8: import { INodeDelegator } from "./interfaces/INodeDelegator.sol";

9: import { IStrategy } from "./interfaces/IStrategy.sol";

9: import { IStrategy } from "./interfaces/IStrategy.sol";

10: import { IEigenStrategyManager } from "./interfaces/IEigenStrategyManager.sol";

10: import { IEigenStrategyManager } from "./interfaces/IEigenStrategyManager.sol";

12: import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";

12: import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";

12: import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";

13: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

13: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

13: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

13: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

14: import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";

14: import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";

14: import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";

14: import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";

113:                 ++i;

113:                 ++i;

```

```solidity
File: src/RSETH.sol

4: import { UtilLib } from "./utils/UtilLib.sol";

4: import { UtilLib } from "./utils/UtilLib.sol";

5: import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";

5: import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";

7: import { ERC20Upgradeable, Initializable } from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

7: import { ERC20Upgradeable, Initializable } from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

7: import { ERC20Upgradeable, Initializable } from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

7: import { ERC20Upgradeable, Initializable } from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

7: import { ERC20Upgradeable, Initializable } from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

8: import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

8: import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

8: import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

8: import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

9: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

9: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

9: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

9: import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

```

```solidity
File: src/oracles/ChainlinkPriceOracle.sol

4: import { UtilLib } from "../utils/UtilLib.sol";

4: import { UtilLib } from "../utils/UtilLib.sol";

6: import { IPriceFetcher } from "../interfaces/IPriceFetcher.sol";

6: import { IPriceFetcher } from "../interfaces/IPriceFetcher.sol";

7: import { LRTConfigRoleChecker, ILRTConfig } from "../utils/LRTConfigRoleChecker.sol";

7: import { LRTConfigRoleChecker, ILRTConfig } from "../utils/LRTConfigRoleChecker.sol";

9: import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

9: import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

9: import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

9: import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

9: import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

```

```solidity
File: src/utils/LRTConfigRoleChecker.sol

4: import { UtilLib } from "./UtilLib.sol";

5: import { LRTConstants } from "./LRTConstants.sol";

7: import { ILRTConfig } from "../interfaces/ILRTConfig.sol";

7: import { ILRTConfig } from "../interfaces/ILRTConfig.sol";

9: import { IAccessControl } from "@openzeppelin/contracts/access/IAccessControl.sol";

9: import { IAccessControl } from "@openzeppelin/contracts/access/IAccessControl.sol";

9: import { IAccessControl } from "@openzeppelin/contracts/access/IAccessControl.sol";

```

### <a name="GAS-3"></a>[GAS-3] Don't initialize variables with default value

*Instances (1)*:
```solidity
File: src/NodeDelegator.sol

109:         for (uint256 i = 0; i < strategiesLength;) {

```

### <a name="GAS-4"></a>[GAS-4] Functions guaranteed to revert when called by normal users can be marked `payable`
If a function modifier such as `onlyOwner` is used, the function will revert if a normal user tries to pay the function. Marking the function as `payable` will lower the gas cost for legitimate callers because the compiler will not include checks for whether a payment was provided.

*Instances (21)*:
```solidity
File: src/LRTConfig.sol

73:     function addNewSupportedAsset(address asset, uint256 depositLimit) external onlyRole(LRTConstants.MANAGER) {

144:     function setRSETH(address rsETH_) external onlyRole(DEFAULT_ADMIN_ROLE) {

149:     function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

165:     function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

```

```solidity
File: src/LRTDepositPool.sol

162:     function addNodeDelegatorContractToQueue(address[] calldata nodeDelegatorContracts) external onlyLRTAdmin {

202:     function updateMaxNodeDelegatorCount(uint256 maxNodeDelegatorCount_) external onlyLRTAdmin {

208:     function pause() external onlyLRTManager {

213:     function unpause() external onlyLRTAdmin {

```

```solidity
File: src/LRTOracle.sol

45:     function getAssetPrice(address asset) public view onlySupportedAsset(asset) returns (uint256) {

102:     function pause() external onlyLRTManager {

107:     function unpause() external onlyLRTAdmin {

```

```solidity
File: src/NodeDelegator.sol

127:     function pause() external onlyLRTManager {

132:     function unpause() external onlyLRTAdmin {

```

```solidity
File: src/RSETH.sol

47:     function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) whenNotPaused {

54:     function burnFrom(address account, uint256 amount) external onlyRole(BURNER_ROLE) whenNotPaused {

60:     function pause() external onlyLRTManager {

66:     function unpause() external onlyRole(DEFAULT_ADMIN_ROLE) {

73:     function updateLRTConfig(address _lrtConfig) external override onlyRole(DEFAULT_ADMIN_ROLE) {

```

```solidity
File: src/oracles/ChainlinkPriceOracle.sol

37:     function getAssetPrice(address asset) external view onlySupportedAsset(asset) returns (uint256) {

45:     function updatePriceFeedFor(address asset, address priceFeed) external onlyLRTManager onlySupportedAsset(asset) {

```

```solidity
File: src/utils/LRTConfigRoleChecker.sol

47:     function updateLRTConfig(address lrtConfigAddr) external virtual onlyLRTAdmin {

```

### <a name="GAS-5"></a>[GAS-5] Using `private` rather than `public` for constants, saves gas
If needed, the values can be read from the verified contract source code, or if there are multiple values there can be a single getter function that [returns a tuple](https://github.com/code-423n4/2022-08-frax/blob/90f55a9ce4e25bceed3a74290b854341d8de6afa/src/contracts/FraxlendPair.sol#L156-L178) of the values of all currently-public constants. Saves **3406-3606 gas** in deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table

*Instances (9)*:
```solidity
File: src/RSETH.sol

21:     bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

22:     bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

```

```solidity
File: src/utils/LRTConstants.sol

7:     bytes32 public constant R_ETH_TOKEN = keccak256("R_ETH_TOKEN");

9:     bytes32 public constant ST_ETH_TOKEN = keccak256("ST_ETH_TOKEN");

11:     bytes32 public constant CB_ETH_TOKEN = keccak256("CB_ETH_TOKEN");

14:     bytes32 public constant LRT_ORACLE = keccak256("LRT_ORACLE");

15:     bytes32 public constant LRT_DEPOSIT_POOL = keccak256("LRT_DEPOSIT_POOL");

16:     bytes32 public constant EIGEN_STRATEGY_MANAGER = keccak256("EIGEN_STRATEGY_MANAGER");

19:     bytes32 public constant MANAGER = keccak256("MANAGER");

```


## Non Critical Issues


| |Issue|Instances|
|-|:-|:-:|
| [NC-1](#NC-1) | Return values of `approve()` not checked | 1 |
### <a name="NC-1"></a>[NC-1] Return values of `approve()` not checked
Not all IERC20 implementations `revert()` when there's a failure in `approve()`. The function signature has a boolean return value and they indicate errors that way instead. By not checking the return value, operations that should have marked as failed, may potentially go through without actually approving anything

*Instances (1)*:
```solidity
File: src/NodeDelegator.sol

45:         IERC20(asset).approve(eigenlayerStrategyManagerAddress, type(uint256).max);

```


## Low Issues


| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Initializers could be front-run | 21 |
| [L-2](#L-2) | Unsafe ERC20 operation(s) | 4 |
### <a name="L-1"></a>[L-1] Initializers could be front-run
Initializers could be front-run, allowing an attacker to either set their own values, take ownership of the contract, and in the best case forcing a re-deployment

*Instances (21)*:
```solidity
File: src/LRTConfig.sol

41:     function initialize(

49:         initializer

57:         __AccessControl_init();

```

```solidity
File: src/LRTDepositPool.sol

31:     function initialize(address lrtConfigAddr) external initializer {

31:     function initialize(address lrtConfigAddr) external initializer {

33:         __Pausable_init();

34:         __ReentrancyGuard_init();

```

```solidity
File: src/LRTOracle.sol

29:     function initialize(address lrtConfigAddr) external initializer {

29:     function initialize(address lrtConfigAddr) external initializer {

31:         __Pausable_init();

```

```solidity
File: src/NodeDelegator.sol

26:     function initialize(address lrtConfigAddr) external initializer {

26:     function initialize(address lrtConfigAddr) external initializer {

28:         __Pausable_init();

29:         __ReentrancyGuard_init();

```

```solidity
File: src/RSETH.sol

32:     function initialize(address admin, address lrtConfigAddr) external initializer {

32:     function initialize(address admin, address lrtConfigAddr) external initializer {

36:         __ERC20_init("rsETH", "rsETH");

37:         __Pausable_init();

38:         __AccessControl_init();

```

```solidity
File: src/oracles/ChainlinkPriceOracle.sol

27:     function initialize(address lrtConfig_) external initializer {

27:     function initialize(address lrtConfig_) external initializer {

```

### <a name="L-2"></a>[L-2] Unsafe ERC20 operation(s)

*Instances (4)*:
```solidity
File: src/LRTDepositPool.sol

136:         if (!IERC20(asset).transferFrom(msg.sender, address(this), depositAmount)) {

194:         if (!IERC20(asset).transfer(nodeDelegator, amount)) {

```

```solidity
File: src/NodeDelegator.sol

45:         IERC20(asset).approve(eigenlayerStrategyManagerAddress, type(uint256).max);

86:         if (!IERC20(asset).transfer(lrtDepositPool, amount)) {

```


## Medium Issues


| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Centralization Risk for trusted owners | 13 |
| [M-2](#M-2) | Use of deprecated chainlink function: `latestAnswer()` | 1 |
### <a name="M-1"></a>[M-1] Centralization Risk for trusted owners

#### Impact:
Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

*Instances (13)*:
```solidity
File: src/LRTConfig.sol

73:     function addNewSupportedAsset(address asset, uint256 depositLimit) external onlyRole(LRTConstants.MANAGER) {

99:         onlyRole(LRTConstants.MANAGER)

114:         onlyRole(DEFAULT_ADMIN_ROLE)

144:     function setRSETH(address rsETH_) external onlyRole(DEFAULT_ADMIN_ROLE) {

149:     function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

165:     function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

```

```solidity
File: src/RSETH.sol

47:     function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) whenNotPaused {

54:     function burnFrom(address account, uint256 amount) external onlyRole(BURNER_ROLE) whenNotPaused {

66:     function unpause() external onlyRole(DEFAULT_ADMIN_ROLE) {

73:     function updateLRTConfig(address _lrtConfig) external override onlyRole(DEFAULT_ADMIN_ROLE) {

```

```solidity
File: src/utils/LRTConfigRoleChecker.sol

9: import { IAccessControl } from "@openzeppelin/contracts/access/IAccessControl.sol";

21:         if (!IAccessControl(address(lrtConfig)).hasRole(LRTConstants.MANAGER, msg.sender)) {

29:         if (!IAccessControl(address(lrtConfig)).hasRole(DEFAULT_ADMIN_ROLE, msg.sender)) {

```

### <a name="M-2"></a>[M-2] Use of deprecated chainlink function: `latestAnswer()`
According to Chainlink’s documentation [(API Reference)](https://docs.chain.link/data-feeds/api-reference#latestanswer), the latestAnswer function is deprecated. This function does not throw an error if no answer has been reached, but instead returns 0, possibly causing an incorrect price to be fed to the different price feeds or even a Denial of Service.

*Instances (1)*:
```solidity
File: src/oracles/ChainlinkPriceOracle.sol

38:         return AggregatorInterface(assetPriceFeed[asset]).latestAnswer();

```

