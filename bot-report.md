

```bash
# # # # # # # # # # # # # # # # # # # # # #
#                                         #
#             |\_/|                       #
#             | O O                       #
#             |   <>              _       #
#             |  _/\------____ ((| |))    #
#             |               `--' |      #
#         ____|_       ___|   |___.'      #
#        /_/_____/____/_______|           #
#    _   _                           _    #
#   | | | |                         | |   #
#   | |_| |  ___   _   _  _ __    __| |   #
#   |  _  | / _ \ | | | || '_ \  / _` |   #
#   | | | || (_) || |_| || | | || (_| |   #
#   \_| |_/ \___/  \__,_||_| |_| \__,_|   #
#                                         #
# # # # # # # # # # # # # # # # # # # # # #
```


## Summary

---

### Medium Risk Issues
|Id|Title|Instances|
|:--:|:------|:--:|
|[[M-01]](#m-01-transfertransferfrom-may-never-return-true-for-some-tokens)| `transfer/transferFrom` may never return `true` for some tokens | 3 |
|[[M-02]](#m-02-approve-will-always-revert-as-the-ierc20-interface-mismatch)| `approve` will always revert as the `IERC20` interface mismatch | 1 |
|[[M-03]](#m-03-some-functions-do-not-work-correctly-with-fee-on-transfer-tokens)| Some functions do not work correctly with fee-on-transfer tokens | 1 |
|[[M-04]](#m-04-some-erc20-can-revert-on-a-zero-value-transfer)| Some `ERC20` can revert on a zero value `transfer` | 2 |
|[[M-05]](#m-05-non-compliant-ierc20-tokens-may-revert-with-transfer)| Non-compliant `IERC20` tokens may revert with `transfer` | 3 |

Total: 10 instances over 5 issues.

### Low Risk Issues
|Id|Title|Instances|
|:--:|:------|:--:|
|[[L-01]](#l-01-return-values-of-approve-not-checked)| Return values of `approve` not checked | 1 |
|[[L-02]](#l-02-avoid-the-use-of-deprecated-chainlink-functions)| Avoid the use of deprecated Chainlink functions | 1 |
|[[L-03]](#l-03-missing-checks-for-state-variable-assignments)| Missing checks for state variable assignments | 3 |
|[[L-04]](#l-04-large-transfers-may-not-work-with-some-erc20-tokens)| Large transfers may not work with some `ERC20` tokens | 2 |
|[[L-05]](#l-05-large-approvals-may-not-work-with-some-erc20-tokens)| Large approvals may not work with some `ERC20` tokens | 1 |
|[[L-06]](#l-06-approve-can-revert-if-the-current-approval-is-not-zero)| `approve` can revert if the current approval is not zero | 1 |
|[[L-07]](#l-07-initializers-could-be-front-run)| Initializers could be front-run | 6 |
|[[L-08]](#l-08-missing-limits-when-setting-minmax-amounts)| Missing limits when setting min/max amounts | 2 |
|[[L-09]](#l-09-external-calls-in-an-unbounded-loop-can-result-in-a-dos)| External calls in an unbounded loop can result in a DoS | 4 |
|[[L-10]](#l-10-upgradeable-contract-is-missing-a-gap-storage-variable)| Upgradeable contract is missing a gap storage variable | 5 |
|[[L-11]](#l-11-lack-of-two-step-update-for-updating-protocol-addresses)| Lack of two-step update for updating protocol addresses | 10 |
|[[L-12]](#l-12-loss-of-precision-on-division)| Loss of precision on division | 2 |
|[[L-13]](#l-13-arrays-can-grow-in-size-without-a-way-to-shrink-them)| Arrays can grow in size without a way to shrink them | 2 |

Total: 40 instances over 13 issues.

### Non Critical Issues
|Id|Title|Instances|
|:--:|:------|:--:|
|[[N-01]](#n-01-missing-events-in-sensitive-functions)| Missing events in sensitive functions | 2 |
|[[N-02]](#n-02-missing-events-in-initializers)| Missing events in initializers | 1 |
|[[N-03]](#n-03-setters-should-prevent-re-setting-the-same-value)| Setters should prevent re-setting the same value | 10 |
|[[N-04]](#n-04-unused-named-return)| Unused named `return` | 3 |
|[[N-05]](#n-05-whennotpaused-is-not-used-anywhere)| `whenNotPaused` is not used anywhere | 1 |
|[[N-06]](#n-06-variable-initialization-with-zero-value)| Variable initialization with zero value | 1 |
|[[N-07]](#n-07-missing-global-emergency-stop)| Missing global emergency stop | 4 |
|[[N-08]](#n-08-some-functions-contain-the-same-exact-logic)| Some functions contain the same exact logic | 8 |
|[[N-09]](#n-09-unbounded-loop-may-run-out-of-gas)| Unbounded loop may run out of gas | 2 |
|[[N-10]](#n-10-large-multiples-of-ten-should-use-scientific-notation)| Large multiples of ten should use scientific notation | 3 |
|[[N-11]](#n-11-interfaces-should-have-an-i-prefix-in-the-contract-name)| Interfaces should have an `I` prefix in the contract name | 1 |
|[[N-12]](#n-12-dependence-on-external-protocols)| Dependence on external protocols | 15 |
|[[N-13]](#n-13-possible-reentrancy-in-modifiers-placed-before-nonreentrant)| Possible reentrancy in modifiers placed before `nonReentrant` | 3 |
|[[N-14]](#n-14-use-of-non-named-numeric-constants)| Use of non-named numeric constants | 5 |
|[[N-15]](#n-15-control-structures-do-not-comply-with-best-practices)| Control structures do not comply with best practices | 1 |
|[[N-16]](#n-16-use-a-single-file-for-system-wide-constants)| Use a single file for system wide constants | 2 |
|[[N-17]](#n-17-no-checks-for-empty-bytes)| No checks for empty bytes | 6 |
|[[N-18]](#n-18-use-of-constant-variables-instead-of-immutable)| Use of `constant` variables instead of `immutable` | 9 |
|[[N-19]](#n-19-contract-functions-should-use-an-interface)| Contract functions should use an `interface` | 33 |
|[[N-20]](#n-20-imports-should-be-organized-more-systematically)| Imports should be organized more systematically | 5 |
|[[N-21]](#n-21-event-is-missing-msgsender-parameter)| Event is missing `msg.sender` parameter | 17 |
|[[N-22]](#n-22-top-level-declarations-should-be-separated-by-at-least-two-lines)| Top-level declarations should be separated by at least two lines | 4 |
|[[N-23]](#n-23-use-a-struct-to-encapsulate-multiple-function-parameters)| Use a struct to encapsulate multiple function parameters | 1 |
|[[N-24]](#n-24-events-should-emit-both-new-and-old-values)| Events should emit both new and old values | 7 |
|[[N-25]](#n-25-declare-interfaces-on-separate-files)| Declare interfaces on separate files | 1 |
|[[N-26]](#n-26-custom-error-without-details)| Custom `error` without details | 1 |
|[[N-27]](#n-27-dont-use-uppercase-for-non-constantimmutable-variables)| Don't use uppercase for non `constant`/`immutable` variables | 1 |
|[[N-28]](#n-28-constants-in-comparisons-should-appear-on-the-left-side)| Constants in comparisons should appear on the left side | 2 |
|[[N-29]](#n-29-unused-import)| Unused import | 2 |
|[[N-30]](#n-30-layout-order-does-not-comply-with-best-practices)| Layout order does not comply with best practices | 1 |
|[[N-31]](#n-31-function-visibility-order-does-not-comply-with-best-practices)| Function visibility order does not comply with best practices | 19 |
|[[N-32]](#n-32-lines-are-too-long)| Lines are too long | 2 |
|[[N-33]](#n-33-consider-adding-a-blockdeny-list)| Consider adding a block/deny-list | 1 |
|[[N-34]](#n-34-use-of-override-is-unnecessary)| Use of `override` is unnecessary | 13 |
|[[N-35]](#n-35-contracts-should-have-full-test-coverage)| Contracts should have full test coverage | - |
|[[N-36]](#n-36-large-or-complicated-code-bases-should-implement-invariant-tests)| Large or complicated code bases should implement invariant tests | - |
|[[N-37]](#n-37-codebase-should-implement-formal-verification-testing)| Codebase should implement formal verification testing | - |
|[[N-38]](#n-38-state-variables-should-include-comments)| State variables should include comments | 16 |
|[[N-39]](#n-39-use-inheritdoc-for-overridden-functions)| Use `@inheritdoc` for overridden functions | 13 |
|[[N-40]](#n-40-variable-names-dont-follow-the-solidity-naming-convention)| Variable names don't follow the Solidity naming convention | 2 |
|[[N-41]](#n-41-missing-underscore-prefix-for-non-external-functions)| Missing underscore prefix for non-external functions | 1 |
|[[N-42]](#n-42-missing-natspec-from-contract-declarations)| Missing NatSpec from contract declarations | 2 |
|[[N-43]](#n-43-missing-natspec-author-from-contract-declaration)| Missing NatSpec `@author` from contract declaration | 9 |
|[[N-44]](#n-44-missing-natspec-dev-from-contract-declaration)| Missing NatSpec `@dev` from contract declaration | 10 |
|[[N-45]](#n-45-missing-natspec-notice-from-contract-declaration)| Missing NatSpec `@notice` from contract declaration | 2 |
|[[N-46]](#n-46-missing-natspec-title-from-contract-declaration)| Missing NatSpec `@title` from contract declaration | 2 |
|[[N-47]](#n-47-missing-natspec-from-error-declaration)| Missing NatSpec from error declaration | 1 |
|[[N-48]](#n-48-missing-natspec-dev-from-error-declaration)| Missing NatSpec `@dev` from error declaration | 1 |
|[[N-49]](#n-49-missing-natspec-notice-from-error-declaration)| Missing NatSpec `@notice` from error declaration | 1 |
|[[N-50]](#n-50-missing-natspec-param-from-error-declaration)| Missing NatSpec `@param` from error declaration | 1 |
|[[N-51]](#n-51-missing-natspec-from-event-declaration)| Missing NatSpec from event declaration | 1 |
|[[N-52]](#n-52-missing-natspec-dev-from-event-declaration)| Missing NatSpec `@dev` from event declaration | 1 |
|[[N-53]](#n-53-missing-natspec-notice-from-event-declaration)| Missing NatSpec `@notice` from event declaration | 1 |
|[[N-54]](#n-54-missing-natspec-param-from-event-declaration)| Missing NatSpec `@param` from event declaration | 1 |
|[[N-55]](#n-55-missing-natspec-from-modifiers-definitions)| Missing NatSpec from modifiers definitions | 4 |
|[[N-56]](#n-56-missing-natspec-dev-from-modifier-declaration)| Missing NatSpec `@dev` from modifier declaration | 4 |
|[[N-57]](#n-57-missing-natspec-notice-from-modifier-declaration)| Missing NatSpec `@notice` from modifier declaration | 4 |
|[[N-58]](#n-58-missing-natspec-param-from-modifier-declaration)| Missing NatSpec `@param` from modifier declaration | 4 |
|[[N-59]](#n-59-missing-natspec-from-function-definitions)| Missing NatSpec from function definitions | 6 |
|[[N-60]](#n-60-missing-natspec-dev-from-function-declaration)| Missing NatSpec `@dev` from function declaration | 14 |
|[[N-61]](#n-61-missing-natspec-notice-from-function-declaration)| Missing NatSpec `@notice` from function declaration | 33 |
|[[N-62]](#n-62-missing-natspec-param-from-function-declaration)| Missing NatSpec `@param` from function declaration | 18 |
|[[N-63]](#n-63-incomplete-natspec-return-from-function-declaration)| Incomplete NatSpec `@return` from function declaration | 4 |

Total: 343 instances over 63 issues.

### Gas Optimizations
|Id|Title|Instances|Gas Saved|
|:--:|:------|:--:|---:|
|[[G-01]](#g-01-state-variables-access-within-a-loop)| State variables access within a loop | 1 | 265 |
|[[G-02]](#g-02-cache-state-variables-with-stack-variables)| Cache state variables with stack variables | 3 | 700 |
|[[G-03]](#g-03-avoid-updating-storage-when-the-value-hasnt-changed)| Avoid updating storage when the value hasn't changed | 10 | 7,000 |
|[[G-04]](#g-04-use-of-emit-inside-a-loop)| Use of `emit` inside a loop | 1 | 1,026 |
|[[G-05]](#g-05-cache-multiple-accesses-of-a-mappingarray)| Cache multiple accesses of a mapping/array | 1 | 42 |
|[[G-06]](#g-06-redundant-state-variable-getters)| Redundant state variable getters | 4 | - |
|[[G-07]](#g-07-using-private-for-constants-saves-gas)| Using `private` for constants saves gas | 1 | 8,406 |
|[[G-08]](#g-08-using-bool-for-storage-incurs-overhead)| Using `bool` for storage incurs overhead | 1 | 17,100 |
|[[G-09]](#g-09-consider-activating-via-ir-for-deploying)| Consider activating `via-ir` for deploying | - | - |
|[[G-10]](#g-10-functions-that-revert-when-called-by-normal-users-can-be-payable)| Functions that revert when called by normal users can be `payable` | 27 | 567 |
|[[G-11]](#g-11-add-unchecked-blocks-for-divisions-where-the-operands-cannot-overflow)| Add `unchecked` blocks for divisions where the operands cannot overflow | 2 | 318 |
|[[G-12]](#g-12-usage-of-uintsints-smaller-than-32-bytes-256-bits-incurs-overhead)| Usage of `uints`/`ints` smaller than 32 bytes (256 bits) incurs overhead | 1 | 6 |
|[[G-13]](#g-13-stack-variable-cost-less-while-used-in-emiting-event)| Stack variable cost less while used in emiting event | 1 | 9 |
|[[G-14]](#g-14--costs-less-gas-than)| `>=`/`<=` costs less gas than `>`/`<` | 6 | 18 |
|[[G-15]](#g-15-inline-modifiers-that-are-only-used-once-to-save-gas)| Inline `modifiers` that are only used once, to save gas | 1 | - |
|[[G-16]](#g-16-private-functions-only-called-once-can-be-inlined-to-save-gas)| `private` functions only called once can be inlined to save gas | 2 | 40 |
|[[G-17]](#g-17-unused-named-return-variables-without-optimizer-waste-gas)| Unused named return variables without optimizer waste gas | 2 | 6 |
|[[G-18]](#g-18-function-names-can-be-optimized)| Function names can be optimized | 8 | 176 |
|[[G-19]](#g-19-avoid-zero-transfers-calls)| Avoid zero transfers calls | 3 | - |
|[[G-20]](#g-20-constructors-can-be-marked-payable)| Constructors can be marked `payable` | 6 | 126 |
|[[G-21]](#g-21-use-assembly-to-check-for-address0)| Use assembly to check for `address(0)` | 1 | 6 |
|[[G-22]](#g-22-use-assembly-to-validate-msgsender)| Use assembly to validate `msg.sender` | 3 | 36 |
|[[G-23]](#g-23-use-assembly-to-write-address-storage-values)| Use assembly to write `address` storage values | 3 | 222 |
|[[G-24]](#g-24-use-assembly-to-emit-an-event)| Use assembly to emit an `event` | 17 | 646 |

Total: 105 instances over 24 issues with an estimate of **36,715 gas** saved.

### Disputed Issues
|Id|Title|Instances|
|:--:|:------|:--:|
|[[D-01]](#d-01-its-possible-to-mint-to-address0)| It's possible to mint to `address(0)` | 1 |
|[[D-02]](#d-02-missing-checks-for-address0-in-constructorinitializers)| Missing checks for `address(0)` in constructor/initializers | 6 |
|[[D-03]](#d-03-missing-checks-for-address0-when-updating-state-variables)| Missing checks for `address(0)` when updating state variables | 13 |
|[[D-04]](#d-04-enum-values-should-be-used-in-place-of-constant-array-indexes)| Enum values should be used in place of constant array indexes | 28 |
|[[D-05]](#d-05-missing-initializer-modifier)| Missing `initializer` modifier | 4 |
|[[D-06]](#d-06-upgradeable-contract-is-missing-a-constructor-that-disables-initialization)| Upgradeable contract is missing a constructor that disables initialization | 6 |
|[[D-07]](#d-07-upgradeable-contract-is-missing-a-gap-storage-variable)| Upgradeable contract is missing a gap storage variable | 1 |
|[[D-08]](#d-08-modifier-order-does-not-comply-with-best-practices)| Modifier order does not comply with best practices | - |
|[[D-09]](#d-09-visibility-should-be-set-explicitly-rather-than-defaulting-to-internal)| Visibility should be set explicitly rather than defaulting to internal | - |
|[[D-10]](#d-10-consider-using-named-mappings)| Consider using named mappings | - |

Total: 59 instances over 10 issues.

## Medium Risk Issues

---

### [M-01] `transfer/transferFrom` may never return `true` for some tokens

Some tokens do not return a bool (e.g. USDT, OMG) on transfer. As there are some conditions that rely on this `bool` value, these tokens may cause issues, as the return value of the following conditions will always be `false`.

*There are 3 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
136: 		        if (!IERC20(asset).transferFrom(msg.sender, address(this), depositAmount)) {

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
194: 		        if (!IERC20(asset).transfer(nodeDelegator, amount)) {
```
[[136](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L136), [194](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L194)]



```solidity
File: src/NodeDelegator.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
86: 		        if (!IERC20(asset).transfer(lrtDepositPool, amount)) {
```
[[86](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L86)]


---

### [M-02] `approve` will always revert as the `IERC20` interface mismatch

Some tokens, such as [USDT](https://etherscan.io/token/0xdac17f958d2ee523a2206206994597c13d831ec7#code#L199), have a different implementation for the approve function: when the address is cast to a compliant `IERC20` interface and the approve function is used, it will always revert due to the interface mismatch.

*There is 1 instance of this issue.*


```solidity
File: src/NodeDelegator.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
45: 		        IERC20(asset).approve(eigenlayerStrategyManagerAddress, type(uint256).max);
```
[[45](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L45)]


---

### [M-03] Some functions do not work correctly with fee-on-transfer tokens

Some tokens take a transfer fee (e.g. `STA`, `PAXG`), some do not currently charge a fee but may do so in the future (e.g. `USDT`, `USDC`).

Should a fee-on-transfer token be added as an asset and deposited, it could be abused, as the accounting is wrong. In the current implementation the following function calls do not work well with fee-on-transfer tokens as the amount variable is the pre-fee amount, including the fee, whereas the final balance do not include the fee anymore.

*There is 1 instance of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
136: 		        if (!IERC20(asset).transferFrom(msg.sender, address(this), depositAmount)) {
```
[[136](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L136)]


---

### [M-04] Some `ERC20` can revert on a zero value `transfer`

Not all `ERC20` implementations are totally compliant, and some (e.g `LEND`) may fail while transfering a zero amount.

*There are 2 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
194: 		        if (!IERC20(asset).transfer(nodeDelegator, amount)) {
```
[[194](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L194)]



```solidity
File: src/NodeDelegator.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
86: 		        if (!IERC20(asset).transfer(lrtDepositPool, amount)) {
```
[[86](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L86)]


---

### [M-05] Non-compliant `IERC20` tokens may revert with `transfer`

Some `IERC20` tokens (e.g. BNB, OMG, USDT) do not implement the standard properly, but they are still accepted by most code that accepts `ERC20` tokens.

For example, USDT `transfer` functions on L1 do not return booleans: when casted to `IERC20`, their function signatures do not match, and therefore the calls made will revert.

*There are 3 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
136: 		        if (!IERC20(asset).transferFrom(msg.sender, address(this), depositAmount)) {

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
194: 		        if (!IERC20(asset).transfer(nodeDelegator, amount)) {
```
[[136](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L136), [194](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L194)]



```solidity
File: src/NodeDelegator.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
86: 		        if (!IERC20(asset).transfer(lrtDepositPool, amount)) {
```
[[86](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L86)]


---

## Low Risk Issues

---

### [L-01] Return values of `approve` not checked

Not all `IERC20` implementations (e.g. USDT, KNC) `revert` when there's a failure in `approve`. The function signature has a boolean return value and they indicate errors that way instead.

By not checking the return value, operations that should have marked as failed, may potentially go through without actually approving anything.

*There is 1 instance of this issue.*


```solidity
File: src/NodeDelegator.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
45: 		        IERC20(asset).approve(eigenlayerStrategyManagerAddress, type(uint256).max);
```
[[45](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L45)]


---

### [L-02] Avoid the use of deprecated Chainlink functions

Some functions use a deprecated version of Chainlink functions, consider following the [documentation](https://docs.chain.link/data-feeds/api-reference) to use the supported alternatives.

*There is 1 instance of this issue.*


```solidity
File: src/oracles/ChainlinkPriceOracle.sol

// @audit latestAnswer
38: 		        return AggregatorInterface(assetPriceFeed[asset]).latestAnswer();
```
[[38](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L38)]


---

### [L-03] Missing checks for state variable assignments

There are some missing checks in these functions, and this could lead to unexpected scenarios. Consider always adding a sanity check for state variables.

*There are 3 instances of this issue.*


```solidity
File: src/LRTConfig.sol

87: 		        depositLimitByAsset[asset] = depositLimit;

102: 		        depositLimitByAsset[asset] = depositLimit;
```
[[87](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L87), [102](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L102)]



```solidity
File: src/LRTDepositPool.sol

203: 		        maxNodeDelegatorCount = maxNodeDelegatorCount_;
```
[[203](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L203)]


---

### [L-04] Large transfers may not work with some `ERC20` tokens

Some `IERC20` implementations (e.g `UNI`, `COMP`) may fail if the valued `transferred` is larger than `uint96`. [Source](https://github.com/d-xo/weird-erc20/blob/main/src/Uint96.sol).

*There are 2 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
194: 		        if (!IERC20(asset).transfer(nodeDelegator, amount)) {
```
[[194](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L194)]



```solidity
File: src/NodeDelegator.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
86: 		        if (!IERC20(asset).transfer(lrtDepositPool, amount)) {
```
[[86](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L86)]


---

### [L-05] Large approvals may not work with some `ERC20` tokens

Not all `IERC20` implementations are totally compliant, and some (e.g `UNI`, `COMP`) may fail if the valued passed to `approve` is larger than `uint96`. If the approval amount is `type(uint256).max`, which may cause issues with systems that expect the value passed to approve to be reflected in the allowances mapping.

*There is 1 instance of this issue.*


```solidity
File: src/NodeDelegator.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
45: 		        IERC20(asset).approve(eigenlayerStrategyManagerAddress, type(uint256).max);
```
[[45](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L45)]


---

### [L-06] `approve` can revert if the current approval is not zero

Some tokens like USDT check for the current approval, and they revert if it's not zero. While Tether is known to do this, it applies to other tokens as well, which are trying to protect against [this](https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/edit) attack vector.

*There is 1 instance of this issue.*


```solidity
File: src/NodeDelegator.sol

// @audit asset is limited by modifier onlySupportedAsset, but it can still be added with LRTConfig.addNewSupportedAsset
45: 		        IERC20(asset).approve(eigenlayerStrategyManagerAddress, type(uint256).max);
```
[[45](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L45)]


---

### [L-07] Initializers could be front-run

Initializers could be front-run, allowing an attacker to either set their own values, take ownership of the contract, and in the best case forcing a re-deployment.

*There are 6 instances of this issue.*


```solidity
File: src/LRTConfig.sol

41: 		    function initialize(
```
[[41](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L41)]



```solidity
File: src/LRTDepositPool.sol

31: 		    function initialize(address lrtConfigAddr) external initializer {
```
[[31](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L31)]



```solidity
File: src/LRTOracle.sol

29: 		    function initialize(address lrtConfigAddr) external initializer {
```
[[29](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L29)]



```solidity
File: src/NodeDelegator.sol

26: 		    function initialize(address lrtConfigAddr) external initializer {
```
[[26](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L26)]



```solidity
File: src/RSETH.sol

32: 		    function initialize(address admin, address lrtConfigAddr) external initializer {
```
[[32](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L32)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

27: 		    function initialize(address lrtConfig_) external initializer {
```
[[27](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L27)]


---

### [L-08] Missing limits when setting min/max amounts

There are some missing limits in these functions, and this could lead to unexpected scenarios. Consider adding a min/max limit for the following values, when appropriate.

*There are 2 instances of this issue.*


```solidity
File: src/LRTConfig.sol

// @audit missing both checks -> depositLimit
94: 		    function updateAssetDepositLimit(
95: 		        address asset,
96: 		        uint256 depositLimit
```
[[94-96](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L94-L96)]



```solidity
File: src/LRTDepositPool.sol

// @audit missing both checks -> maxNodeDelegatorCount_
202: 		    function updateMaxNodeDelegatorCount(uint256 maxNodeDelegatorCount_) external onlyLRTAdmin {
```
[[202](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L202)]


---

### [L-09] External calls in an unbounded loop can result in a DoS

Consider limiting the number of iterations in loops that make external calls, as just a single one of them failing will result in a revert.

*There are 4 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit balanceOf (83), getAssetBalance (84)
82: 		        for (uint256 i; i < ndcsCount;) {

// @audit checkNonZeroAddress (169)
168: 		        for (uint256 i; i < length;) {
```
[[82](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L82), [168](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L168)]



```solidity
File: src/LRTOracle.sol

// @audit getTotalAssetDeposits (70)
66: 		        for (uint16 asset_idx; asset_idx < supportedAssetCount;) {
```
[[66](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L66)]



```solidity
File: src/NodeDelegator.sol

// @audit underlyingToken (110), userUnderlyingView (111)
109: 		        for (uint256 i = 0; i < strategiesLength;) {
```
[[109](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L109)]


---

### [L-10] Upgradeable contract is missing a gap storage variable

If a contract is extended, a gap storage variable will allow to freely add new state variables in the future, without compromising the storage compatibility with existing deployments.

[OpenZeppelin docs](https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps) 

*There are 5 instances of this issue.*


```solidity
File: src/LRTConfig.sol

12: 		contract LRTConfig is ILRTConfig, AccessControlUpgradeable {
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L12)]



```solidity
File: src/LRTDepositPool.sol

19: 		contract LRTDepositPool is ILRTDepositPool, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L19)]



```solidity
File: src/LRTOracle.sol

19: 		contract LRTOracle is ILRTOracle, LRTConfigRoleChecker, PausableUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L19)]



```solidity
File: src/NodeDelegator.sol

18: 		contract NodeDelegator is INodeDelegator, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[18](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L18)]



```solidity
File: src/RSETH.sol

14: 		contract RSETH is
```
[[14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L14)]


---

### [L-11] Lack of two-step update for updating protocol addresses

Add a two-step process for any critical address changes.

*There are 10 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

73: 		    function addNewSupportedAsset(address asset, uint256 depositLimit) external onlyRole(LRTConstants.MANAGER) {
74: 		        _addNewSupportedAsset(asset, depositLimit);
75: 		    }

94: 		    function updateAssetDepositLimit(
95: 		        address asset,
96: 		        uint256 depositLimit
97: 		    )
98: 		        external
99: 		        onlyRole(LRTConstants.MANAGER)
100: 		        onlySupportedAsset(asset)
101: 		    {
102: 		        depositLimitByAsset[asset] = depositLimit;
103: 		        emit AssetDepositLimitUpdate(asset, depositLimit);
104: 		    }

109: 		    function updateAssetStrategy(
110: 		        address asset,
111: 		        address strategy
112: 		    )
113: 		        external
114: 		        onlyRole(DEFAULT_ADMIN_ROLE)
115: 		        onlySupportedAsset(asset)
116: 		    {
117: 		        UtilLib.checkNonZeroAddress(strategy);
118: 		        if (assetStrategy[asset] == strategy) {
119: 		            revert ValueAlreadyInUse();
120: 		        }
121: 		        assetStrategy[asset] = strategy;
122: 		    }

144: 		    function setRSETH(address rsETH_) external onlyRole(DEFAULT_ADMIN_ROLE) {
145: 		        UtilLib.checkNonZeroAddress(rsETH_);
146: 		        rsETH = rsETH_;
147: 		    }

149: 		    function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
150: 		        _setToken(tokenKey, assetAddress);
151: 		    }

165: 		    function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
166: 		        _setContract(contractKey, contractAddress);
167: 		    }
```
[[73-75](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L73-L75), [94-104](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L94-L104), [109-122](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L109-L122), [144-147](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L144-L147), [149-151](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L149-L151), [165-167](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L165-L167)]



```solidity
File: src/LRTOracle.sol

88: 		    function updatePriceOracleFor(
89: 		        address asset,
90: 		        address priceOracle
91: 		    )
92: 		        external
93: 		        onlyLRTManager
94: 		        onlySupportedAsset(asset)
95: 		    {
96: 		        UtilLib.checkNonZeroAddress(priceOracle);
97: 		        assetPriceOracle[asset] = priceOracle;
98: 		        emit AssetPriceOracleUpdate(asset, priceOracle);
99: 		    }
```
[[88-99](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L88-L99)]



```solidity
File: src/RSETH.sol

73: 		    function updateLRTConfig(address _lrtConfig) external override onlyRole(DEFAULT_ADMIN_ROLE) {
74: 		        UtilLib.checkNonZeroAddress(_lrtConfig);
75: 		        lrtConfig = ILRTConfig(_lrtConfig);
76: 		        emit UpdatedLRTConfig(_lrtConfig);
77: 		    }
```
[[73-77](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L73-L77)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

45: 		    function updatePriceFeedFor(address asset, address priceFeed) external onlyLRTManager onlySupportedAsset(asset) {
46: 		        UtilLib.checkNonZeroAddress(priceFeed);
47: 		        assetPriceFeed[asset] = priceFeed;
48: 		        emit AssetPriceFeedUpdate(asset, priceFeed);
49: 		    }
```
[[45-49](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L45-L49)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

47: 		    function updateLRTConfig(address lrtConfigAddr) external virtual onlyLRTAdmin {
48: 		        UtilLib.checkNonZeroAddress(lrtConfigAddr);
49: 		        lrtConfig = ILRTConfig(lrtConfigAddr);
50: 		        emit UpdatedLRTConfig(lrtConfigAddr);
51: 		    }
```
[[47-51](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L47-L51)]

</details>

---

### [L-12] Loss of precision on division

Solidity doesn't support fractions, so divisions by large numbers could result in the quotient being zero.

To avoid this, it's recommended to require a minimum numerator amount to ensure that it is always greater than the denominator.

*There are 2 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

109: 		        rsethAmountToMint = (amount * lrtOracle.getAssetPrice(asset)) / lrtOracle.getRSETHPrice();
```
[[109](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L109)]



```solidity
File: src/LRTOracle.sol

78: 		        return totalETHInPool / rsEthSupply;
```
[[78](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L78)]


---

### [L-13] Arrays can grow in size without a way to shrink them

As these arrays cannot shrink, if the array has a maximum size, it won't be possible to change its elements once it reaches that size. Otherwise, it can grow indefinitely in size, which can increase the likelihood of out-of-gas errors.

*There are 2 instances of this issue.*


```solidity
File: src/LRTConfig.sol

86: 		        supportedAssetList.push(asset);
```
[[86](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L86)]



```solidity
File: src/LRTDepositPool.sol

170: 		            nodeDelegatorQueue.push(nodeDelegatorContracts[i]);
```
[[170](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L170)]


---

## Non Critical Issues

---

### [N-01] Missing events in sensitive functions

Events should be emitted when sensitive changes are made to the contracts, but some functions lack them.

*There are 2 instances of this issue.*


```solidity
File: src/LRTConfig.sol

109: 		    function updateAssetStrategy(
110: 		        address asset,
111: 		        address strategy
112: 		    )
113: 		        external
114: 		        onlyRole(DEFAULT_ADMIN_ROLE)
115: 		        onlySupportedAsset(asset)
116: 		    {
117: 		        UtilLib.checkNonZeroAddress(strategy);
118: 		        if (assetStrategy[asset] == strategy) {
119: 		            revert ValueAlreadyInUse();
120: 		        }
121: 		        assetStrategy[asset] = strategy;
122: 		    }

144: 		    function setRSETH(address rsETH_) external onlyRole(DEFAULT_ADMIN_ROLE) {
145: 		        UtilLib.checkNonZeroAddress(rsETH_);
146: 		        rsETH = rsETH_;
147: 		    }
```
[[109-122](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L109-L122), [144-147](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L144-L147)]


---

### [N-02] Missing events in initializers

As a best practice, consider emitting an event when the contract is initialized. In this way, it's easy for the user to track the exact point in time when the contract was initialized, by filtering the emitted events.

*There is 1 instance of this issue.*


```solidity
File: src/LRTConfig.sol

41: 		    function initialize(
```
[[41](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L41)]


---

### [N-03] Setters should prevent re-setting the same value

Not only is wasteful in terms of gas, but this is especially problematic when an event is emitted and the old and new values set are the same, as listeners might not expect this kind of scenario.

*There are 10 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

// @audit depositLimitByAsset
94: 		    function updateAssetDepositLimit(

// @audit assetStrategy
109: 		    function updateAssetStrategy(

// @audit rsETH
144: 		    function setRSETH(address rsETH_) external onlyRole(DEFAULT_ADMIN_ROLE) {

// @audit tokenMap
156: 		    function _setToken(bytes32 key, address val) private {

// @audit contractMap
172: 		    function _setContract(bytes32 key, address val) private {
```
[[94](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L94), [109](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L109), [144](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L144), [156](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L156), [172](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L172)]



```solidity
File: src/LRTDepositPool.sol

// @audit maxNodeDelegatorCount
202: 		    function updateMaxNodeDelegatorCount(uint256 maxNodeDelegatorCount_) external onlyLRTAdmin {
```
[[202](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L202)]



```solidity
File: src/LRTOracle.sol

// @audit assetPriceOracle
88: 		    function updatePriceOracleFor(
```
[[88](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L88)]



```solidity
File: src/RSETH.sol

// @audit lrtConfig
73: 		    function updateLRTConfig(address _lrtConfig) external override onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[73](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L73)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

// @audit assetPriceFeed
45: 		    function updatePriceFeedFor(address asset, address priceFeed) external onlyLRTManager onlySupportedAsset(asset) {
```
[[45](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L45)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

// @audit lrtConfig
47: 		    function updateLRTConfig(address lrtConfigAddr) external virtual onlyLRTAdmin {
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L47)]

</details>

---

### [N-04] Unused named `return`

Declaring named returns, but not using them, is confusing to the reader. Consider either completely removing them (by declaring just the type without a name), or remove the return statement and do a variable assignment.

This would improve the readability of the code, and it may also help reduce regressions during future code refactors.

*There are 3 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

47: 		    function getTotalAssetDeposits(address asset) public view override returns (uint256 totalAssetDeposit) {

50: 		        return (assetLyingInDepositPool + assetLyingInNDCs + assetStakedInEigenLayer);

76: 		        returns (uint256 assetLyingInDepositPool, uint256 assetLyingInNDCs, uint256 assetStakedInEigenLayer)
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L47), [76](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L76)]



```solidity
File: src/LRTOracle.sol

52: 		    function getRSETHPrice() external view returns (uint256 rsETHPrice) {

57: 		            return 1 ether;

78: 		        return totalETHInPool / rsEthSupply;
```
[[52](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L52)]


---

### [N-05] `whenNotPaused` is not used anywhere

These contracts import a pausable library, but there aren't any functions reserved to pause/unpause the contract. If this is an error, add the `whenNotPaused` modifier to the appropriate functions; otherwise, remove this import.

*There is 1 instance of this issue.*


```solidity
File: src/LRTOracle.sol

19: 		contract LRTOracle is ILRTOracle, LRTConfigRoleChecker, PausableUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L19)]


---

### [N-06] Variable initialization with zero value

It's not necessary to initialize a variable with a zero value, as it's the default behaviour, and it's actually worse in gas terms as it adds an overhead.

*There is 1 instance of this issue.*


```solidity
File: src/NodeDelegator.sol

109: 		        for (uint256 i = 0; i < strategiesLength;) {
```
[[109](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L109)]


---

### [N-07] Missing global emergency stop

Consider adding a global pause mechanism to pause all the contracts at once, instead of doing it one by one: this might be useful in case of an emergency.

*There are 4 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

19: 		contract LRTDepositPool is ILRTDepositPool, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L19)]



```solidity
File: src/LRTOracle.sol

19: 		contract LRTOracle is ILRTOracle, LRTConfigRoleChecker, PausableUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L19)]



```solidity
File: src/NodeDelegator.sol

18: 		contract NodeDelegator is INodeDelegator, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[18](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L18)]



```solidity
File: src/RSETH.sol

14: 		contract RSETH is
15: 		    Initializable,
16: 		    LRTConfigRoleChecker,
17: 		    ERC20Upgradeable,
18: 		    PausableUpgradeable,
19: 		    AccessControlUpgradeable
```
[[14-19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L14-L19)]


---

### [N-08] Some functions contain the same exact logic

These functions might be a problem if the logic changes before the contract is deployed, as the developer must remember to syncronize the logic between all the function instances.

Consider using a single function instead of duplicating the code, for example by using a `library`, or through inheritance.

*There are 8 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit duplicated logic in src/LRTDepositPool.sol -> pause, src/LRTOracle.sol -> pause, src/NodeDelegator.sol -> pause, src/RSETH.sol -> pause
208: 		    function pause() external onlyLRTManager {

// @audit duplicated logic in src/LRTDepositPool.sol -> unpause, src/LRTOracle.sol -> unpause, src/NodeDelegator.sol -> unpause, src/RSETH.sol -> unpause
213: 		    function unpause() external onlyLRTAdmin {
```
[[208](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L208), [213](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L213)]



```solidity
File: src/LRTOracle.sol

// @audit duplicated logic in src/LRTDepositPool.sol -> pause, src/LRTOracle.sol -> pause, src/NodeDelegator.sol -> pause, src/RSETH.sol -> pause
102: 		    function pause() external onlyLRTManager {

// @audit duplicated logic in src/LRTDepositPool.sol -> unpause, src/LRTOracle.sol -> unpause, src/NodeDelegator.sol -> unpause, src/RSETH.sol -> unpause
107: 		    function unpause() external onlyLRTAdmin {
```
[[102](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L102), [107](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L107)]



```solidity
File: src/NodeDelegator.sol

// @audit duplicated logic in src/LRTDepositPool.sol -> pause, src/LRTOracle.sol -> pause, src/NodeDelegator.sol -> pause, src/RSETH.sol -> pause
127: 		    function pause() external onlyLRTManager {

// @audit duplicated logic in src/LRTDepositPool.sol -> unpause, src/LRTOracle.sol -> unpause, src/NodeDelegator.sol -> unpause, src/RSETH.sol -> unpause
132: 		    function unpause() external onlyLRTAdmin {
```
[[127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L127), [132](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L132)]



```solidity
File: src/RSETH.sol

// @audit duplicated logic in src/LRTDepositPool.sol -> pause, src/LRTOracle.sol -> pause, src/NodeDelegator.sol -> pause, src/RSETH.sol -> pause
60: 		    function pause() external onlyLRTManager {

// @audit duplicated logic in src/LRTDepositPool.sol -> unpause, src/LRTOracle.sol -> unpause, src/NodeDelegator.sol -> unpause, src/RSETH.sol -> unpause
66: 		    function unpause() external onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[60](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L60), [66](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L66)]


---

### [N-09] Unbounded loop may run out of gas

Consider limiting the number of iterations in loops with an explicit revert reason to avoid iterating an array that is too large.

The function would eventually revert if out of gas anyway, but by limiting it the user avoids wasting too much gas, as the loop doesn't execute if an excessive value is provided.

*There are 2 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

82: 		        for (uint256 i; i < ndcsCount;) {
83: 		            assetLyingInNDCs += IERC20(asset).balanceOf(nodeDelegatorQueue[i]);
84: 		            assetStakedInEigenLayer += INodeDelegator(nodeDelegatorQueue[i]).getAssetBalance(asset);
85: 		            unchecked {
86: 		                ++i;
87: 		            }
88: 		        }

168: 		        for (uint256 i; i < length;) {
169: 		            UtilLib.checkNonZeroAddress(nodeDelegatorContracts[i]);
170: 		            nodeDelegatorQueue.push(nodeDelegatorContracts[i]);
171: 		            emit NodeDelegatorAddedinQueue(nodeDelegatorContracts[i]);
172: 		            unchecked {
173: 		                ++i;
174: 		            }
175: 		        }
```
[[82-88](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L82-L88), [168-175](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L168-L175)]


---

### [N-10] Large multiples of ten should use scientific notation

Use a scientific notation rather than decimal literals (e.g. `1e6` instead of `1000000`), for better code readability.

*There are 3 instances of this issue.*


```solidity
File: src/LRTConfig.sol

// @audit 100_000 -> 1e5
61: 		        _addNewSupportedAsset(stETH, 100_000 ether);

// @audit 100_000 -> 1e5
62: 		        _addNewSupportedAsset(rETH, 100_000 ether);

// @audit 100_000 -> 1e5
63: 		        _addNewSupportedAsset(cbETH, 100_000 ether);
```
[[61](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L61), [62](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L62), [63](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L63)]


---

### [N-11] Interfaces should have an `I` prefix in the contract name

As a best practice, any `interface` should have an `I` as a prefix in their contract name.

*There is 1 instance of this issue.*


```solidity
File: src/oracles/ChainlinkPriceOracle.sol

11: 		interface AggregatorInterface {
```
[[11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L11)]


---

### [N-12] Dependence on external protocols

External protocols should be monitored as such dependencies may introduce vulnerabilities if a vulnerability is found in the external protocol.

*There are 15 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

8: 		import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
```
[[8](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L8)]



```solidity
File: src/LRTDepositPool.sol

13: 		import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

14: 		import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

15: 		import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
```
[[13](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L13), [14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L14), [15](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L15)]



```solidity
File: src/LRTOracle.sol

14: 		import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";

15: 		import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
```
[[14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L14), [15](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L15)]



```solidity
File: src/NodeDelegator.sol

12: 		import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";

13: 		import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

14: 		import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L12), [13](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L13), [14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L14)]



```solidity
File: src/RSETH.sol

7: 		import { ERC20Upgradeable, Initializable } from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

8: 		import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

9: 		import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
```
[[7](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L7), [8](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L8), [9](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L9)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

9: 		import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

17: 		contract ChainlinkPriceOracle is IPriceFetcher, LRTConfigRoleChecker, Initializable {
```
[[9](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L9), [17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L17)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

9: 		import { IAccessControl } from "@openzeppelin/contracts/access/IAccessControl.sol";
```
[[9](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L9)]

</details>

---

### [N-13] Possible reentrancy in modifiers placed before `nonReentrant`

It might be possible to reenter in other modifiers, as `nonReentrant` is not declared as the first one and the modifier execution is sequential.

*There are 3 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

119: 		    function depositAsset(
120: 		        address asset,
121: 		        uint256 depositAmount
122: 		    )
123: 		        external
124: 		        whenNotPaused
125: 		        nonReentrant
126: 		        onlySupportedAsset(asset)
```
[[119-126](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L119-L126)]



```solidity
File: src/NodeDelegator.sol

51: 		    function depositAssetIntoStrategy(address asset)
52: 		        external
53: 		        override
54: 		        whenNotPaused
55: 		        nonReentrant
56: 		        onlySupportedAsset(asset)
57: 		        onlyLRTManager

74: 		    function transferBackToLRTDepositPool(
75: 		        address asset,
76: 		        uint256 amount
77: 		    )
78: 		        external
79: 		        whenNotPaused
80: 		        nonReentrant
81: 		        onlySupportedAsset(asset)
82: 		        onlyLRTManager
```
[[51-57](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L51-L57), [74-82](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L74-L82)]


---

### [N-14] Use of non-named numeric constants

Constants should be defined instead of using magic numbers.

*There are 5 instances of this issue.*


```solidity
File: src/LRTConfig.sol

// @audit 100_000
61: 		        _addNewSupportedAsset(stETH, 100_000 ether);

// @audit 100_000
62: 		        _addNewSupportedAsset(rETH, 100_000 ether);

// @audit 100_000
63: 		        _addNewSupportedAsset(cbETH, 100_000 ether);
```
[[61](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L61), [62](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L62), [63](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L63)]



```solidity
File: src/LRTDepositPool.sol

// @audit 10
35: 		        maxNodeDelegatorCount = 10;
```
[[35](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L35)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

// @audit 0x00
28: 		        bytes32 DEFAULT_ADMIN_ROLE = 0x00;
```
[[28](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L28)]


---

### [N-15] Control structures do not comply with best practices

This is a [best practice](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) that should be followed. 

*There is 1 instance of this issue.*


```solidity
File: src/utils/UtilLib.sol

12: 		        if (address_ == address(0)) revert ZeroAddressNotAllowed();
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L12)]


---

### [N-16] Use a single file for system wide constants

Consider grouping all the system constants under a single file. This finding shows only the first constant for each file, for brevity.

*There are 2 instances of this issue.*


```solidity
File: src/RSETH.sol

21: 		    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
```
[[21](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L21)]



```solidity
File: src/utils/LRTConstants.sol

7: 		    bytes32 public constant R_ETH_TOKEN = keccak256("R_ETH_TOKEN");
```
[[7](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L7)]


---

### [N-17] No checks for empty bytes

Like the zero-address check, an empty bytes assignment might be undesiderable, but the following functions don't have it.

*There are 6 instances of this issue.*


```solidity
File: src/LRTConfig.sol

// @audit tokenKey
127: 		    function getLSTToken(bytes32 tokenKey) external view override returns (address) {

// @audit contractKey
131: 		    function getContract(bytes32 contractKey) external view override returns (address) {

// @audit tokenKey
149: 		    function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

// @audit key
156: 		    function _setToken(bytes32 key, address val) private {

// @audit contractKey
165: 		    function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

// @audit key
172: 		    function _setContract(bytes32 key, address val) private {
```
[[127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L127), [131](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L131), [149](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L149), [156](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L156), [165](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L165), [172](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L172)]


---

### [N-18] Use of `constant` variables instead of `immutable`

Constant variables and immutable variables serve different purposes and should be used accordingly.

To clarify, constant variables are used for literal values in the code, whereas immutable variables are ideal for values calculated or passed into the constructor.

*There are 9 instances of this issue.*


```solidity
File: src/RSETH.sol

21: 		    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

22: 		    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
```
[[21](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L21), [22](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L22)]



```solidity
File: src/utils/LRTConstants.sol

7: 		    bytes32 public constant R_ETH_TOKEN = keccak256("R_ETH_TOKEN");

9: 		    bytes32 public constant ST_ETH_TOKEN = keccak256("ST_ETH_TOKEN");

11: 		    bytes32 public constant CB_ETH_TOKEN = keccak256("CB_ETH_TOKEN");

14: 		    bytes32 public constant LRT_ORACLE = keccak256("LRT_ORACLE");

15: 		    bytes32 public constant LRT_DEPOSIT_POOL = keccak256("LRT_DEPOSIT_POOL");

16: 		    bytes32 public constant EIGEN_STRATEGY_MANAGER = keccak256("EIGEN_STRATEGY_MANAGER");

19: 		    bytes32 public constant MANAGER = keccak256("MANAGER");
```
[[7](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L7), [9](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L9), [11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L11), [14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L14), [15](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L15), [16](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L16), [19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L19)]


---

### [N-19] Contract functions should use an `interface`

All `external`/`public` functions should extend an `interface`. This is useful to make sure that the whole API is extracted.

*There are 33 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

41: 		    function initialize(

73: 		    function addNewSupportedAsset(address asset, uint256 depositLimit) external onlyRole(LRTConstants.MANAGER) {

94: 		    function updateAssetDepositLimit(

109: 		    function updateAssetStrategy(

144: 		    function setRSETH(address rsETH_) external onlyRole(DEFAULT_ADMIN_ROLE) {

149: 		    function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

165: 		    function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[41](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L41), [73](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L73), [94](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L94), [109](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L109), [144](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L144), [149](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L149), [165](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L165)]



```solidity
File: src/LRTDepositPool.sol

31: 		    function initialize(address lrtConfigAddr) external initializer {

119: 		    function depositAsset(

162: 		    function addNodeDelegatorContractToQueue(address[] calldata nodeDelegatorContracts) external onlyLRTAdmin {

183: 		    function transferAssetToNodeDelegator(

202: 		    function updateMaxNodeDelegatorCount(uint256 maxNodeDelegatorCount_) external onlyLRTAdmin {

208: 		    function pause() external onlyLRTManager {

213: 		    function unpause() external onlyLRTAdmin {
```
[[31](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L31), [119](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L119), [162](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L162), [183](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L183), [202](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L202), [208](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L208), [213](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L213)]



```solidity
File: src/LRTOracle.sol

29: 		    function initialize(address lrtConfigAddr) external initializer {

45: 		    function getAssetPrice(address asset) public view onlySupportedAsset(asset) returns (uint256) {

52: 		    function getRSETHPrice() external view returns (uint256 rsETHPrice) {

88: 		    function updatePriceOracleFor(

102: 		    function pause() external onlyLRTManager {

107: 		    function unpause() external onlyLRTAdmin {
```
[[29](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L29), [45](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L45), [52](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L52), [88](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L88), [102](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L102), [107](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L107)]



```solidity
File: src/NodeDelegator.sol

26: 		    function initialize(address lrtConfigAddr) external initializer {

74: 		    function transferBackToLRTDepositPool(

127: 		    function pause() external onlyLRTManager {

132: 		    function unpause() external onlyLRTAdmin {
```
[[26](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L26), [74](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L74), [127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L127), [132](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L132)]



```solidity
File: src/RSETH.sol

32: 		    function initialize(address admin, address lrtConfigAddr) external initializer {

47: 		    function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) whenNotPaused {

54: 		    function burnFrom(address account, uint256 amount) external onlyRole(BURNER_ROLE) whenNotPaused {

60: 		    function pause() external onlyLRTManager {

66: 		    function unpause() external onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[32](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L32), [47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L47), [54](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L54), [60](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L60), [66](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L66)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

27: 		    function initialize(address lrtConfig_) external initializer {

37: 		    function getAssetPrice(address asset) external view onlySupportedAsset(asset) returns (uint256) {

45: 		    function updatePriceFeedFor(address asset, address priceFeed) external onlyLRTManager onlySupportedAsset(asset) {
```
[[27](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L27), [37](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L37), [45](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L45)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

47: 		    function updateLRTConfig(address lrtConfigAddr) external virtual onlyLRTAdmin {
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L47)]

</details>

---

### [N-20] Imports should be organized more systematically

The contract's interface should be imported first, followed by each of the interfaces it uses, followed by all other files. The examples below do not follow this layout.

*There are 5 instances of this issue.*


```solidity
File: src/LRTConfig.sol

6: 		import { ILRTConfig } from "./interfaces/ILRTConfig.sol";
```
[[6](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L6)]



```solidity
File: src/LRTDepositPool.sol

7: 		import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";
```
[[7](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L7)]



```solidity
File: src/LRTOracle.sol

6: 		import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";
```
[[6](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L6)]



```solidity
File: src/NodeDelegator.sol

6: 		import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";
```
[[6](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L6)]



```solidity
File: src/RSETH.sol

5: 		import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";
```
[[5](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L5)]


---

### [N-21] Event is missing `msg.sender` parameter

The following functions are missing some parameters when emitting an event: when dealing with a source address which uses the value of `msg.sender`, the `msg.sender` value should be specified in every event.

Otherwise, a contract or web page listening to events cannot react to connected users: basically, those events cannot be used properly.

*There are 17 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

88: 		        emit AddedNewSupportedAsset(asset, depositLimit);

103: 		        emit AssetDepositLimitUpdate(asset, depositLimit);

162: 		        emit SetToken(key, val);

178: 		        emit SetContract(key, val);
```
[[88](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L88), [103](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L103), [162](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L162), [178](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L178)]



```solidity
File: src/LRTDepositPool.sol

37: 		        emit UpdatedLRTConfig(lrtConfigAddr);

143: 		        emit AssetDeposit(asset, depositAmount, rsethAmountMinted);

171: 		            emit NodeDelegatorAddedinQueue(nodeDelegatorContracts[i]);

204: 		        emit MaxNodeDelegatorCountUpdated(maxNodeDelegatorCount);
```
[[37](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L37), [143](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L143), [171](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L171), [204](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L204)]



```solidity
File: src/LRTOracle.sol

34: 		        emit UpdatedLRTConfig(lrtConfigAddr);

98: 		        emit AssetPriceOracleUpdate(asset, priceOracle);
```
[[34](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L34), [98](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L98)]



```solidity
File: src/NodeDelegator.sol

32: 		        emit UpdatedLRTConfig(lrtConfigAddr);

65: 		        emit AssetDepositIntoStrategy(asset, strategy, balance);
```
[[32](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L32), [65](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L65)]



```solidity
File: src/RSETH.sol

41: 		        emit UpdatedLRTConfig(lrtConfigAddr);

76: 		        emit UpdatedLRTConfig(_lrtConfig);
```
[[41](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L41), [76](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L76)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

31: 		        emit UpdatedLRTConfig(lrtConfig_);

48: 		        emit AssetPriceFeedUpdate(asset, priceFeed);
```
[[31](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L31), [48](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L48)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

50: 		        emit UpdatedLRTConfig(lrtConfigAddr);
```
[[50](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L50)]

</details>

---

### [N-22] Top-level declarations should be separated by at least two lines

Surround top level declarations in Solidity source with two blank lines. [Documentation](https://docs.soliditylang.org/en/latest/style-guide.html#blank-lines)

*There are 4 instances of this issue.*


```solidity
File: src/LRTConfig.sol

129: 		    }
130: 		
131: 		    function getContract(bytes32 contractKey) external view override returns (address) {

133: 		    }
134: 		
135: 		    function getSupportedAssetList() external view override returns (address[] memory) {

147: 		    }
148: 		
149: 		    function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

163: 		    }
164: 		
165: 		    function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[129-131](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L129-L131), [133-135](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L133-L135), [147-149](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L147-L149), [163-165](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L163-L165)]


---

### [N-23] Use a struct to encapsulate multiple function parameters

If a function has too many parameters, replacing them with a struct can improve code readability and maintainability, increase reusability, and reduce the likelihood of errors when passing the parameters.

*There is 1 instance of this issue.*


```solidity
File: src/LRTConfig.sol

41: 		    function initialize(
42: 		        address admin,
43: 		        address stETH,
44: 		        address rETH,
45: 		        address cbETH,
46: 		        address rsETH_
```
[[41-46](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L41-L46)]


---

### [N-24] Events should emit both new and old values

Events are generally emitted when sensitive changes are made to the contracts.

However, some are missing important parameters, as they should include both the new value and old value where possible.

*There are 7 instances of this issue.*


```solidity
File: src/LRTConfig.sol

103: 		        emit AssetDepositLimitUpdate(asset, depositLimit);

162: 		        emit SetToken(key, val);

178: 		        emit SetContract(key, val);
```
[[103](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L103), [162](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L162), [178](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L178)]



```solidity
File: src/LRTOracle.sol

98: 		        emit AssetPriceOracleUpdate(asset, priceOracle);
```
[[98](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L98)]



```solidity
File: src/RSETH.sol

76: 		        emit UpdatedLRTConfig(_lrtConfig);
```
[[76](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L76)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

48: 		        emit AssetPriceFeedUpdate(asset, priceFeed);
```
[[48](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L48)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

50: 		        emit UpdatedLRTConfig(lrtConfigAddr);
```
[[50](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L50)]


---

### [N-25] Declare interfaces on separate files

Interfaces should be declared on a separate file and not on the same file where the contract resides in.

*There is 1 instance of this issue.*


```solidity
File: src/oracles/ChainlinkPriceOracle.sol

11: 		interface AggregatorInterface {
```
[[11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L11)]


---

### [N-26] Custom `error` without details

Consider adding some parameters to the error to indicate which user or values caused the failure.

*There is 1 instance of this issue.*


```solidity
File: src/utils/UtilLib.sol

7: 		    error ZeroAddressNotAllowed();
```
[[7](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L7)]


---

### [N-27] Don't use uppercase for non `constant`/`immutable` variables

Variables which are not constants or immutable should **not** be declared in all uppercase.

*There is 1 instance of this issue.*


```solidity
File: src/utils/LRTConfigRoleChecker.sol

28: 		        bytes32 DEFAULT_ADMIN_ROLE = 0x00;
```
[[28](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L28)]


---

### [N-28] Constants in comparisons should appear on the left side

This is useful to avoid doing some [typo bugs](https://www.moserware.com/2008/01/constants-on-left-are-better-but-this.html).

*There are 2 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

129: 		        if (depositAmount == 0) {
```
[[129](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L129)]



```solidity
File: src/LRTOracle.sol

56: 		        if (rsEthSupply == 0) {
```
[[56](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L56)]


---

### [N-29] Unused import

Some imports are not used, consider removing them.

*There are 2 instances of this issue.*


```solidity
File: src/LRTOracle.sol

// @audit INodeDelegator
12: 		import { INodeDelegator } from "./interfaces/INodeDelegator.sol";

// @audit IERC20
14: 		import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L12), [14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L14)]


---

### [N-30] Layout order does not comply with best practices

This is a [best practice](https://docs.soliditylang.org/en/latest/style-guide.html#order-of-layout) that should be followed.

Inside each contract, library or interface, use the following order:

1. Type declarations
2. State variables
3. Events
4. Errors
5. Modifiers
6. Functions

*There is 1 instance of this issue.*


```solidity
File: src/LRTConfig.sol

// @audit function constructor found on line 24
28: 		    modifier onlySupportedAsset(address asset) {
```
[[28](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L28)]


---

### [N-31] Function visibility order does not comply with best practices

This is a [best practice](https://docs.soliditylang.org/en/latest/style-guide.html#order-of-functions) that should be followed.

Functions should be grouped according to their visibility and ordered:

1. constructor
2. receive function (if exists)
3. fallback function (if exists)
4. external
5. public
6. internal
7. private

Within a grouping, place the view and pure functions last.

*There are 19 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

// @audit _addNewSupportedAsset on line 80, which is private
94: 		    function updateAssetDepositLimit(

// @audit _addNewSupportedAsset on line 80, which is private
109: 		    function updateAssetStrategy(

// @audit _addNewSupportedAsset on line 80, which is private
127: 		    function getLSTToken(bytes32 tokenKey) external view override returns (address) {

// @audit _addNewSupportedAsset on line 80, which is private
131: 		    function getContract(bytes32 contractKey) external view override returns (address) {

// @audit _addNewSupportedAsset on line 80, which is private
135: 		    function getSupportedAssetList() external view override returns (address[] memory) {

// @audit _addNewSupportedAsset on line 80, which is private
144: 		    function setRSETH(address rsETH_) external onlyRole(DEFAULT_ADMIN_ROLE) {

// @audit _addNewSupportedAsset on line 80, which is private
149: 		    function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

// @audit _setToken on line 156, which is private
165: 		    function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[94](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L94), [109](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L109), [127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L127), [131](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L131), [135](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L135), [144](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L144), [149](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L149), [165](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L165)]



```solidity
File: src/LRTDepositPool.sol

// @audit getAssetCurrentLimit on line 56, which is public
62: 		    function getNodeDelegatorQueue() external view override returns (address[] memory) {

// @audit getRsETHAmountToMint on line 95, which is public
119: 		    function depositAsset(

// @audit _mintRsETH on line 151, which is private
162: 		    function addNodeDelegatorContractToQueue(address[] calldata nodeDelegatorContracts) external onlyLRTAdmin {

// @audit _mintRsETH on line 151, which is private
183: 		    function transferAssetToNodeDelegator(

// @audit _mintRsETH on line 151, which is private
202: 		    function updateMaxNodeDelegatorCount(uint256 maxNodeDelegatorCount_) external onlyLRTAdmin {

// @audit _mintRsETH on line 151, which is private
208: 		    function pause() external onlyLRTManager {

// @audit _mintRsETH on line 151, which is private
213: 		    function unpause() external onlyLRTAdmin {
```
[[62](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L62), [119](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L119), [162](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L162), [183](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L183), [202](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L202), [208](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L208), [213](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L213)]



```solidity
File: src/LRTOracle.sol

// @audit getAssetPrice on line 45, which is public
52: 		    function getRSETHPrice() external view returns (uint256 rsETHPrice) {

// @audit getAssetPrice on line 45, which is public
88: 		    function updatePriceOracleFor(

// @audit getAssetPrice on line 45, which is public
102: 		    function pause() external onlyLRTManager {

// @audit getAssetPrice on line 45, which is public
107: 		    function unpause() external onlyLRTAdmin {
```
[[52](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L52), [88](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L88), [102](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L102), [107](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L107)]

</details>

---

### [N-32] Lines are too long

Maximum suggested line length is 120 characters according to the [documentation](https://docs.soliditylang.org/en/latest/style-guide.html#maximum-line-length).

*There are 2 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

15: 		import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
```
[[15](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L15)]



```solidity
File: src/NodeDelegator.sol

14: 		import { ReentrancyGuardUpgradeable } from "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
```
[[14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L14)]


---

### [N-33] Consider adding a block/deny-list

This can help to prevent hackers from using stolen tokens, but as a side effect it will increase the project centralization.

*There is 1 instance of this issue.*


```solidity
File: src/RSETH.sol

17: 		    ERC20Upgradeable,
```
[[17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L17)]


---

### [N-34] Use of `override` is unnecessary

Starting with Solidity version [0.8.8](https://docs.soliditylang.org/en/latest/contracts.html#function-overriding), using the override keyword when the function solely overrides an interface function, and the function doesn't exist in multiple base contracts, is unnecessary.

*There are 13 instances of this issue.*


```solidity
File: src/LRTConfig.sol

127: 		    function getLSTToken(bytes32 tokenKey) external view override returns (address) {

131: 		    function getContract(bytes32 contractKey) external view override returns (address) {

135: 		    function getSupportedAssetList() external view override returns (address[] memory) {
```
[[127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L127), [131](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L131), [135](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L135)]



```solidity
File: src/LRTDepositPool.sol

47: 		    function getTotalAssetDeposits(address asset) public view override returns (uint256 totalAssetDeposit) {

56: 		    function getAssetCurrentLimit(address asset) public view override returns (uint256) {

62: 		    function getNodeDelegatorQueue() external view override returns (address[] memory) {

71: 		    function getAssetDistributionData(address asset)

95: 		    function getRsETHAmountToMint(
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L47), [56](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L56), [62](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L62), [71](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L71), [95](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L95)]



```solidity
File: src/NodeDelegator.sol

38: 		    function maxApproveToEigenStrategyManager(address asset)

51: 		    function depositAssetIntoStrategy(address asset)

94: 		    function getAssetBalances()

121: 		    function getAssetBalance(address asset) external view override returns (uint256) {
```
[[38](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L38), [51](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L51), [94](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L94), [121](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L121)]



```solidity
File: src/RSETH.sol

73: 		    function updateLRTConfig(address _lrtConfig) external override onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[73](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L73)]


---

### [N-35] Contracts should have full test coverage

A 100% test coverage is not foolproof, but it helps immensely in reducing the amount of bugs that may occur.



---

### [N-36] Large or complicated code bases should implement invariant tests

This includes: large code bases, or code with lots of inline-assembly, complicated math, or complicated interactions between multiple contracts.

Invariant fuzzers such as Echidna require the test writer to come up with invariants which should not be violated under any circumstances, and the fuzzer tests various inputs and function calls to ensure that the invariants always hold.

Even code with 100% code coverage can still have bugs due to the order of the operations a user performs, and invariant fuzzers may help significantly.



---

### [N-37] Codebase should implement formal verification testing

Formal verification is the act of proving or disproving the correctness of intended algorithms underlying a system with respect to a certain formal specification/property/invariant, using formal methods of mathematics.

Some tools that are currently available to perform these tests on smart contracts are [SMTChecker](https://docs.soliditylang.org/en/latest/smtchecker.html) and [Certora Prover](https://www.certora.com/).



---

### [N-38] State variables should include comments

Consider adding some comments on critical state variables to explain what they are supposed to do: this will help for future code reviews.

*There are 16 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

13: 		    mapping(bytes32 tokenKey => address tokenAddress) public tokenMap;

14: 		    mapping(bytes32 contractKey => address contractAddress) public contractMap;

15: 		    mapping(address token => bool isSupported) public isSupportedAsset;

16: 		    mapping(address token => uint256 amount) public depositLimitByAsset;

17: 		    mapping(address token => address strategy) public override assetStrategy;

19: 		    address[] public supportedAssetList;

21: 		    address public rsETH;
```
[[13](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L13), [14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L14), [15](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L15), [16](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L16), [17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L17), [19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L19), [21](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L21)]



```solidity
File: src/LRTDepositPool.sol

20: 		    uint256 public maxNodeDelegatorCount;

22: 		    address[] public nodeDelegatorQueue;
```
[[20](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L20), [22](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L22)]



```solidity
File: src/LRTOracle.sol

20: 		    mapping(address asset => address priceOracle) public override assetPriceOracle;
```
[[20](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L20)]



```solidity
File: src/RSETH.sol

21: 		    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

22: 		    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
```
[[21](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L21), [22](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L22)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

18: 		    mapping(address asset => address priceFeed) public override assetPriceFeed;
```
[[18](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L18)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

14: 		    ILRTConfig public lrtConfig;
```
[[14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L14)]



```solidity
File: src/utils/LRTConstants.sol

15: 		    bytes32 public constant LRT_DEPOSIT_POOL = keccak256("LRT_DEPOSIT_POOL");

16: 		    bytes32 public constant EIGEN_STRATEGY_MANAGER = keccak256("EIGEN_STRATEGY_MANAGER");
```
[[15](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L15), [16](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L16)]

</details>

---

### [N-39] Use `@inheritdoc` for overridden functions

`@inheritdoc` Copies all missing tags from the base function. [Documentation](https://docs.soliditylang.org/en/latest/natspec-format.html#tags)

*There are 13 instances of this issue.*


```solidity
File: src/LRTConfig.sol

127: 		    function getLSTToken(bytes32 tokenKey) external view override returns (address) {

131: 		    function getContract(bytes32 contractKey) external view override returns (address) {

135: 		    function getSupportedAssetList() external view override returns (address[] memory) {
```
[[127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L127), [131](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L131), [135](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L135)]



```solidity
File: src/LRTDepositPool.sol

47: 		    function getTotalAssetDeposits(address asset) public view override returns (uint256 totalAssetDeposit) {

56: 		    function getAssetCurrentLimit(address asset) public view override returns (uint256) {

62: 		    function getNodeDelegatorQueue() external view override returns (address[] memory) {

71: 		    function getAssetDistributionData(address asset)

95: 		    function getRsETHAmountToMint(
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L47), [56](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L56), [62](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L62), [71](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L71), [95](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L95)]



```solidity
File: src/NodeDelegator.sol

38: 		    function maxApproveToEigenStrategyManager(address asset)

51: 		    function depositAssetIntoStrategy(address asset)

94: 		    function getAssetBalances()

121: 		    function getAssetBalance(address asset) external view override returns (uint256) {
```
[[38](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L38), [51](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L51), [94](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L94), [121](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L121)]



```solidity
File: src/RSETH.sol

73: 		    function updateLRTConfig(address _lrtConfig) external override onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[73](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L73)]


---

### [N-40] Variable names don't follow the Solidity naming convention

Use `mixedCase` for local and state variables that are not constants, and add a trailing underscore for non-external variables. [Documentation](https://docs.soliditylang.org/en/latest/style-guide.html#local-and-state-variable-names)

*There are 2 instances of this issue.*


```solidity
File: src/LRTOracle.sol

// @audit asset_idx
66: 		        for (uint16 asset_idx; asset_idx < supportedAssetCount;) {
```
[[66](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L66)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

// @audit DEFAULT_ADMIN_ROLE
28: 		        bytes32 DEFAULT_ADMIN_ROLE = 0x00;
```
[[28](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L28)]


---

### [N-41] Missing underscore prefix for non-external functions

This convention is suggested for non-external functions (private or internal). [Documentation](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*There is 1 instance of this issue.*


```solidity
File: src/utils/UtilLib.sol

11: 		    function checkNonZeroAddress(address address_) internal pure {
```
[[11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L11)]


---

### [N-42] Missing NatSpec from contract declarations

Some contracts miss a `@dev/@notice` NatSpec, which should be a [best practice](https://docs.soliditylang.org/en/latest/natspec-format.html) to add as a documentation.

*There are 2 instances of this issue.*


```solidity
File: src/oracles/ChainlinkPriceOracle.sol

11: 		interface AggregatorInterface {
```
[[11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L11)]



```solidity
File: src/utils/LRTConstants.sol

4: 		library LRTConstants {
```
[[4](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L4)]


---

### [N-43] Missing NatSpec `@author` from contract declaration

Some contract definitions have an incomplete NatSpec: add a `@author` notation to improve the code documentation.

*There are 9 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

12: 		contract LRTConfig is ILRTConfig, AccessControlUpgradeable {
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L12)]



```solidity
File: src/LRTDepositPool.sol

19: 		contract LRTDepositPool is ILRTDepositPool, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L19)]



```solidity
File: src/LRTOracle.sol

19: 		contract LRTOracle is ILRTOracle, LRTConfigRoleChecker, PausableUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L19)]



```solidity
File: src/NodeDelegator.sol

18: 		contract NodeDelegator is INodeDelegator, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[18](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L18)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

11: 		interface AggregatorInterface {

17: 		contract ChainlinkPriceOracle is IPriceFetcher, LRTConfigRoleChecker, Initializable {
```
[[11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L11), [17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L17)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

13: 		abstract contract LRTConfigRoleChecker {
```
[[13](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L13)]



```solidity
File: src/utils/LRTConstants.sol

4: 		library LRTConstants {
```
[[4](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L4)]



```solidity
File: src/utils/UtilLib.sol

6: 		library UtilLib {
```
[[6](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L6)]

</details>

---

### [N-44] Missing NatSpec `@dev` from contract declaration

Some contract definitions have an incomplete NatSpec: add a `@dev` notation to describe the contract to improve the code documentation.

*There are 10 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

12: 		contract LRTConfig is ILRTConfig, AccessControlUpgradeable {
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L12)]



```solidity
File: src/LRTDepositPool.sol

19: 		contract LRTDepositPool is ILRTDepositPool, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L19)]



```solidity
File: src/LRTOracle.sol

19: 		contract LRTOracle is ILRTOracle, LRTConfigRoleChecker, PausableUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L19)]



```solidity
File: src/NodeDelegator.sol

18: 		contract NodeDelegator is INodeDelegator, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[18](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L18)]



```solidity
File: src/RSETH.sol

14: 		contract RSETH is
```
[[14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L14)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

11: 		interface AggregatorInterface {

17: 		contract ChainlinkPriceOracle is IPriceFetcher, LRTConfigRoleChecker, Initializable {
```
[[11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L11), [17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L17)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

13: 		abstract contract LRTConfigRoleChecker {
```
[[13](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L13)]



```solidity
File: src/utils/LRTConstants.sol

4: 		library LRTConstants {
```
[[4](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L4)]



```solidity
File: src/utils/UtilLib.sol

6: 		library UtilLib {
```
[[6](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L6)]

</details>

---

### [N-45] Missing NatSpec `@notice` from contract declaration

Some contract definitions have an incomplete NatSpec: add a `@notice` notation to describe the contract to improve the code documentation.

*There are 2 instances of this issue.*


```solidity
File: src/oracles/ChainlinkPriceOracle.sol

11: 		interface AggregatorInterface {
```
[[11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L11)]



```solidity
File: src/utils/LRTConstants.sol

4: 		library LRTConstants {
```
[[4](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L4)]


---

### [N-46] Missing NatSpec `@title` from contract declaration

Some contract definitions have an incomplete NatSpec: add a `@title` notation to describe the contract to improve the code documentation.

*There are 2 instances of this issue.*


```solidity
File: src/oracles/ChainlinkPriceOracle.sol

11: 		interface AggregatorInterface {
```
[[11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L11)]



```solidity
File: src/utils/LRTConstants.sol

4: 		library LRTConstants {
```
[[4](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConstants.sol#L4)]


---

### [N-47] Missing NatSpec from error declaration

Consider adding some comments on error declarations to explain what they are supposed to do: this will help for future code reviews.

*There is 1 instance of this issue.*


```solidity
File: src/utils/UtilLib.sol

7: 		    error ZeroAddressNotAllowed();
```
[[7](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L7)]


---

### [N-48] Missing NatSpec `@dev` from error declaration

Some errors have an incomplete NatSpec: add a `@dev` notation to describe the error to improve the code documentation.

*There is 1 instance of this issue.*


```solidity
File: src/utils/UtilLib.sol

7: 		    error ZeroAddressNotAllowed();
```
[[7](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L7)]


---

### [N-49] Missing NatSpec `@notice` from error declaration

Some errors have an incomplete NatSpec: add a `@notice` notation to describe the error to improve the code documentation.

*There is 1 instance of this issue.*


```solidity
File: src/utils/UtilLib.sol

7: 		    error ZeroAddressNotAllowed();
```
[[7](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L7)]


---

### [N-50] Missing NatSpec `@param` from error declaration

Some errors have an incomplete NatSpec: add a `@param` notation to describe the error parameters to improve the code documentation.

*There is 1 instance of this issue.*


```solidity
File: src/utils/UtilLib.sol

7: 		    error ZeroAddressNotAllowed();
```
[[7](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L7)]


---

### [N-51] Missing NatSpec from event declaration

Consider adding some comments on event declarations to explain what they are supposed to do: this will help for future code reviews.

*There is 1 instance of this issue.*


```solidity
File: src/utils/LRTConfigRoleChecker.sol

17: 		    event UpdatedLRTConfig(address indexed lrtConfig);
```
[[17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L17)]


---

### [N-52] Missing NatSpec `@dev` from event declaration

Some events have an incomplete NatSpec: add a `@dev` notation to describe the event to improve the code documentation.

*There is 1 instance of this issue.*


```solidity
File: src/utils/LRTConfigRoleChecker.sol

17: 		    event UpdatedLRTConfig(address indexed lrtConfig);
```
[[17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L17)]


---

### [N-53] Missing NatSpec `@notice` from event declaration

Some events have an incomplete NatSpec: add a `@notice` notation to describe the event to improve the code documentation.

*There is 1 instance of this issue.*


```solidity
File: src/utils/LRTConfigRoleChecker.sol

17: 		    event UpdatedLRTConfig(address indexed lrtConfig);
```
[[17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L17)]


---

### [N-54] Missing NatSpec `@param` from event declaration

Some events have an incomplete NatSpec: add a `@param` notation to describe the event to improve the code documentation.

*There is 1 instance of this issue.*


```solidity
File: src/utils/LRTConfigRoleChecker.sol

// @audit missing lrtConfig
17: 		    event UpdatedLRTConfig(address indexed lrtConfig);
```
[[17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L17)]


---

### [N-55] Missing NatSpec from modifiers definitions

Consider adding some comments on modifier declarations to explain what they are supposed to do: this will help for future code reviews.

*There are 4 instances of this issue.*


```solidity
File: src/LRTConfig.sol

28: 		    modifier onlySupportedAsset(address asset) {
```
[[28](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L28)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

20: 		    modifier onlyLRTManager() {

27: 		    modifier onlyLRTAdmin() {

35: 		    modifier onlySupportedAsset(address asset) {
```
[[20](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L20), [27](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L27), [35](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L35)]


---

### [N-56] Missing NatSpec `@dev` from modifier declaration

Some modifiers have an incomplete NatSpec: add a `@dev` notation to describe the modifier to improve the code documentation.

*There are 4 instances of this issue.*


```solidity
File: src/LRTConfig.sol

28: 		    modifier onlySupportedAsset(address asset) {
```
[[28](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L28)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

20: 		    modifier onlyLRTManager() {

27: 		    modifier onlyLRTAdmin() {

35: 		    modifier onlySupportedAsset(address asset) {
```
[[20](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L20), [27](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L27), [35](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L35)]


---

### [N-57] Missing NatSpec `@notice` from modifier declaration

Some modifiers have an incomplete NatSpec: add a `@notice` notation to describe the modifier to improve the code documentation.

*There are 4 instances of this issue.*


```solidity
File: src/LRTConfig.sol

28: 		    modifier onlySupportedAsset(address asset) {
```
[[28](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L28)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

20: 		    modifier onlyLRTManager() {

27: 		    modifier onlyLRTAdmin() {

35: 		    modifier onlySupportedAsset(address asset) {
```
[[20](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L20), [27](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L27), [35](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L35)]


---

### [N-58] Missing NatSpec `@param` from modifier declaration

Some modifiers have an incomplete NatSpec: add a `@param` notation to describe the modifier parameters to improve the code documentation.

*There are 4 instances of this issue.*


```solidity
File: src/LRTConfig.sol

// @audit missing asset
28: 		    modifier onlySupportedAsset(address asset) {
```
[[28](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L28)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

20: 		    modifier onlyLRTManager() {

27: 		    modifier onlyLRTAdmin() {

// @audit missing asset
35: 		    modifier onlySupportedAsset(address asset) {
```
[[20](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L20), [27](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L27), [35](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L35)]


---

### [N-59] Missing NatSpec from function definitions

Some functions miss a NatSpec, which should be a [best practice](https://docs.soliditylang.org/en/latest/natspec-format.html) to add as a documentation.

Even if Natspec for internal and private function is not parsed (but this may change in the future, according to the official docs), it still helps while reviewing the codebase.

*There are 6 instances of this issue.*


```solidity
File: src/LRTConfig.sol

127: 		    function getLSTToken(bytes32 tokenKey) external view override returns (address) {

131: 		    function getContract(bytes32 contractKey) external view override returns (address) {

135: 		    function getSupportedAssetList() external view override returns (address[] memory) {

149: 		    function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

165: 		    function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L127), [131](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L131), [135](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L135), [149](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L149), [165](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L165)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

12: 		    function latestAnswer() external view returns (uint256);
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L12)]


---

### [N-60] Missing NatSpec `@dev` from function declaration

Some functions have an incomplete NatSpec: add a `@dev` notation to describe the function to improve the code documentation.

*There are 14 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

127: 		    function getLSTToken(bytes32 tokenKey) external view override returns (address) {

131: 		    function getContract(bytes32 contractKey) external view override returns (address) {

135: 		    function getSupportedAssetList() external view override returns (address[] memory) {

149: 		    function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

165: 		    function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L127), [131](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L131), [135](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L135), [149](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L149), [165](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L165)]



```solidity
File: src/LRTDepositPool.sol

47: 		    function getTotalAssetDeposits(address asset) public view override returns (uint256 totalAssetDeposit) {

56: 		    function getAssetCurrentLimit(address asset) public view override returns (uint256) {

95: 		    function getRsETHAmountToMint(

119: 		    function depositAsset(
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L47), [56](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L56), [95](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L95), [119](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L119)]



```solidity
File: src/NodeDelegator.sol

94: 		    function getAssetBalances()
```
[[94](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L94)]



```solidity
File: src/RSETH.sol

47: 		    function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) whenNotPaused {

54: 		    function burnFrom(address account, uint256 amount) external onlyRole(BURNER_ROLE) whenNotPaused {
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L47), [54](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L54)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

12: 		    function latestAnswer() external view returns (uint256);

37: 		    function getAssetPrice(address asset) external view onlySupportedAsset(asset) returns (uint256) {
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L12), [37](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L37)]

</details>

---

### [N-61] Missing NatSpec `@notice` from function declaration

Some functions have an incomplete NatSpec: add a `@notice` notation to describe the function to improve the code documentation.

*There are 33 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

41: 		    function initialize(

73: 		    function addNewSupportedAsset(address asset, uint256 depositLimit) external onlyRole(LRTConstants.MANAGER) {

80: 		    function _addNewSupportedAsset(address asset, uint256 depositLimit) private {

94: 		    function updateAssetDepositLimit(

109: 		    function updateAssetStrategy(

127: 		    function getLSTToken(bytes32 tokenKey) external view override returns (address) {

131: 		    function getContract(bytes32 contractKey) external view override returns (address) {

135: 		    function getSupportedAssetList() external view override returns (address[] memory) {

144: 		    function setRSETH(address rsETH_) external onlyRole(DEFAULT_ADMIN_ROLE) {

149: 		    function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

156: 		    function _setToken(bytes32 key, address val) private {

165: 		    function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

172: 		    function _setContract(bytes32 key, address val) private {
```
[[41](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L41), [73](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L73), [80](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L80), [94](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L94), [109](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L109), [127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L127), [131](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L131), [135](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L135), [144](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L144), [149](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L149), [156](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L156), [165](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L165), [172](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L172)]



```solidity
File: src/LRTDepositPool.sol

31: 		    function initialize(address lrtConfigAddr) external initializer {

62: 		    function getNodeDelegatorQueue() external view override returns (address[] memory) {

71: 		    function getAssetDistributionData(address asset)

151: 		    function _mintRsETH(address _asset, uint256 _amount) private returns (uint256 rsethAmountToMint) {

208: 		    function pause() external onlyLRTManager {

213: 		    function unpause() external onlyLRTAdmin {
```
[[31](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L31), [62](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L62), [71](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L71), [151](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L151), [208](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L208), [213](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L213)]



```solidity
File: src/LRTOracle.sol

29: 		    function initialize(address lrtConfigAddr) external initializer {

88: 		    function updatePriceOracleFor(

102: 		    function pause() external onlyLRTManager {

107: 		    function unpause() external onlyLRTAdmin {
```
[[29](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L29), [88](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L88), [102](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L102), [107](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L107)]



```solidity
File: src/NodeDelegator.sol

26: 		    function initialize(address lrtConfigAddr) external initializer {

121: 		    function getAssetBalance(address asset) external view override returns (uint256) {

127: 		    function pause() external onlyLRTManager {

132: 		    function unpause() external onlyLRTAdmin {
```
[[26](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L26), [121](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L121), [127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L127), [132](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L132)]



```solidity
File: src/RSETH.sol

32: 		    function initialize(address admin, address lrtConfigAddr) external initializer {

60: 		    function pause() external onlyLRTManager {
```
[[32](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L32), [60](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L60)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

12: 		    function latestAnswer() external view returns (uint256);

27: 		    function initialize(address lrtConfig_) external initializer {

45: 		    function updatePriceFeedFor(address asset, address priceFeed) external onlyLRTManager onlySupportedAsset(asset) {
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L12), [27](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L27), [45](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L45)]



```solidity
File: src/utils/UtilLib.sol

11: 		    function checkNonZeroAddress(address address_) internal pure {
```
[[11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L11)]

</details>

---

### [N-62] Missing NatSpec `@param` from function declaration

Some functions have an incomplete NatSpec: add a `@param` notation to describe the function parameters to improve the code documentation.

*There are 18 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

// @audit missing tokenKey
127: 		    function getLSTToken(bytes32 tokenKey) external view override returns (address) {

// @audit missing contractKey
131: 		    function getContract(bytes32 contractKey) external view override returns (address) {

135: 		    function getSupportedAssetList() external view override returns (address[] memory) {

// @audit missing tokenKey, assetAddress
149: 		    function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

// @audit missing contractKey, contractAddress
165: 		    function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L127), [131](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L131), [135](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L135), [149](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L149), [165](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L165)]



```solidity
File: src/LRTDepositPool.sol

62: 		    function getNodeDelegatorQueue() external view override returns (address[] memory) {

208: 		    function pause() external onlyLRTManager {

213: 		    function unpause() external onlyLRTAdmin {
```
[[62](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L62), [208](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L208), [213](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L213)]



```solidity
File: src/LRTOracle.sol

52: 		    function getRSETHPrice() external view returns (uint256 rsETHPrice) {

// @audit missing priceOracle
88: 		    function updatePriceOracleFor(

102: 		    function pause() external onlyLRTManager {

107: 		    function unpause() external onlyLRTAdmin {
```
[[52](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L52), [88](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L88), [102](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L102), [107](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L107)]



```solidity
File: src/NodeDelegator.sol

94: 		    function getAssetBalances()

127: 		    function pause() external onlyLRTManager {

132: 		    function unpause() external onlyLRTAdmin {
```
[[94](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L94), [127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L127), [132](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L132)]



```solidity
File: src/RSETH.sol

60: 		    function pause() external onlyLRTManager {

66: 		    function unpause() external onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[60](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L60), [66](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L66)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

12: 		    function latestAnswer() external view returns (uint256);
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L12)]

</details>

---

### [N-63] Incomplete NatSpec `@return` from function declaration

Some functions have an incomplete NatSpec: add a `@return` notation to describe the function return value to improve the code documentation.

*There are 4 instances of this issue.*


```solidity
File: src/LRTConfig.sol

127: 		    function getLSTToken(bytes32 tokenKey) external view override returns (address) {

131: 		    function getContract(bytes32 contractKey) external view override returns (address) {

135: 		    function getSupportedAssetList() external view override returns (address[] memory) {
```
[[127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L127), [131](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L131), [135](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L135)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

12: 		    function latestAnswer() external view returns (uint256);
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L12)]


---

## Gas Optimizations

---

### [G-01] State variables access within a loop

State variable reads and writes are more expensive than local variable reads and writes. Therefore, it is recommended to replace state variable reads and writes within loops with a local variable. Gas savings should be multiplied by the average loop length.

*There is 1 instance of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit nodeDelegatorQueue
170: 		            nodeDelegatorQueue.push(nodeDelegatorContracts[i]);
```
[[170](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L170)]


---

### [G-02] Cache state variables with stack variables

Caching of a state variable replaces each Gwarmaccess (**100 gas**) with a cheaper stack read. Other less obvious fixes/optimizations include having local memory caches of state variable structs, or having local caches of state variable contracts/addresses.

*There are 3 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit nodeDelegatorQueue on line 164
170: 		            nodeDelegatorQueue.push(nodeDelegatorContracts[i]);
```
[[170](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L170)]



```solidity
File: src/LRTOracle.sol

// @audit lrtConfig on lines 53, 61
63: 		        address[] memory supportedAssets = lrtConfig.getSupportedAssetList();
```
[[63](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L63)]



```solidity
File: src/NodeDelegator.sol

// @audit lrtConfig on line 59
61: 		        address eigenlayerStrategyManagerAddress = lrtConfig.getContract(LRTConstants.EIGEN_STRATEGY_MANAGER);
```
[[61](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L61)]


---

### [G-03] Avoid updating storage when the value hasn't changed

If the old value is equal to the new value, not re-storing the value will avoid a Gsreset (**2900 gas**), potentially at the expense of a Gcoldsload (**2100 gas**) or a Gwarmaccess (**100 gas**)

*There are 10 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

// @audit depositLimitByAsset
94: 		    function updateAssetDepositLimit(

// @audit assetStrategy
109: 		    function updateAssetStrategy(

// @audit rsETH
144: 		    function setRSETH(address rsETH_) external onlyRole(DEFAULT_ADMIN_ROLE) {

// @audit tokenMap
156: 		    function _setToken(bytes32 key, address val) private {

// @audit contractMap
172: 		    function _setContract(bytes32 key, address val) private {
```
[[94](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L94), [109](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L109), [144](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L144), [156](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L156), [172](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L172)]



```solidity
File: src/LRTDepositPool.sol

// @audit maxNodeDelegatorCount
202: 		    function updateMaxNodeDelegatorCount(uint256 maxNodeDelegatorCount_) external onlyLRTAdmin {
```
[[202](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L202)]



```solidity
File: src/LRTOracle.sol

// @audit assetPriceOracle
88: 		    function updatePriceOracleFor(
```
[[88](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L88)]



```solidity
File: src/RSETH.sol

// @audit lrtConfig
73: 		    function updateLRTConfig(address _lrtConfig) external override onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[73](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L73)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

// @audit assetPriceFeed
45: 		    function updatePriceFeedFor(address asset, address priceFeed) external onlyLRTManager onlySupportedAsset(asset) {
```
[[45](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L45)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

// @audit lrtConfig
47: 		    function updateLRTConfig(address lrtConfigAddr) external virtual onlyLRTAdmin {
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L47)]

</details>

---

### [G-04] Use of `emit` inside a loop

Emitting an event inside a loop performs a `LOG` op N times, where N is the loop length. Consider refactoring the code to emit the event only once at the end of loop. Gas savings should be multiplied by the average loop length.

*There is 1 instance of this issue.*


```solidity
File: src/LRTDepositPool.sol

171: 		            emit NodeDelegatorAddedinQueue(nodeDelegatorContracts[i]);
```
[[171](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L171)]


---

### [G-05] Cache multiple accesses of a mapping/array

Consider using a local `storage` or `calldata` variable when accessing a mapping/array value multiple times.

This can be useful to avoid recalculating the mapping hash and/or the array offsets.

*There is 1 instance of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit nodeDelegatorQueue on line 83
84: 		            assetStakedInEigenLayer += INodeDelegator(nodeDelegatorQueue[i]).getAssetBalance(asset);
```
[[84](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L84)]


---

### [G-06] Redundant state variable getters

Getters for public state variables are automatically generated with public variables, so there is no need to code them manually, as it adds an unnecessary overhead.

*There are 4 instances of this issue.*


```solidity
File: src/LRTConfig.sol

127: 		    function getLSTToken(bytes32 tokenKey) external view override returns (address) {
128: 		        return tokenMap[tokenKey];
129: 		    }

131: 		    function getContract(bytes32 contractKey) external view override returns (address) {
132: 		        return contractMap[contractKey];
133: 		    }

135: 		    function getSupportedAssetList() external view override returns (address[] memory) {
136: 		        return supportedAssetList;
137: 		    }
```
[[127-129](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L127-L129), [131-133](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L131-L133), [135-137](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L135-L137)]



```solidity
File: src/LRTDepositPool.sol

62: 		    function getNodeDelegatorQueue() external view override returns (address[] memory) {
63: 		        return nodeDelegatorQueue;
64: 		    }
```
[[62-64](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L62-L64)]


---

### [G-07] Using `private` for constants saves gas

Saves deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table.

*There is 1 instance of this issue.*


```solidity
File: src/RSETH.sol

22: 		    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
```
[[22](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L22)]


---

### [G-08] Using `bool` for storage incurs overhead

Use `uint256(1)` and `uint256(2)` for `true`/`false` to avoid a Gwarmaccess (100 gas), and to avoid Gsset (20000 gas) when changing from `false` to `true`, after having been `true` in the past. See [source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27).

*There is 1 instance of this issue.*


```solidity
File: src/LRTConfig.sol

15: 		    mapping(address token => bool isSupported) public isSupportedAsset;
```
[[15](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L15)]


---

### [G-09] Consider activating `via-ir` for deploying

The IR-based code generator was developed to make code generation more performant by enabling optimization passes that can be applied across functions.

It is possible to activate the IR-based code generator through the command line by using the flag `--via-ir` or by including the option `{"viaIR": true}`.

Keep in mind that compiling with this option may take longer. However, you can simply test it before deploying your code. If you find that it provides better performance, you can add the `--via-ir` flag to your deploy command.



---

### [G-10] Functions that revert when called by normal users can be `payable`

If a function modifier such as `onlyOwner` is used, the function will revert if a normal user tries to pay the function.

Marking the function as `payable` will lower the gas for legitimate callers, as the compiler will not include checks for whether a payment was provided.

The extra opcodes avoided are:

`CALLVALUE(2), DUP1(3), ISZERO(3), PUSH2(3), JUMPI(10), PUSH1(3), DUP1(3), REVERT(0), JUMPDEST(1), POP(2)`

which cost an average of about 21 gas per call to the function, in addition to the extra deployment cost.

*There are 27 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

73: 		    function addNewSupportedAsset(address asset, uint256 depositLimit) external onlyRole(LRTConstants.MANAGER) {

94: 		    function updateAssetDepositLimit(
95: 		        address asset,
96: 		        uint256 depositLimit
97: 		    )
98: 		        external
99: 		        onlyRole(LRTConstants.MANAGER)
100: 		        onlySupportedAsset(asset)

109: 		    function updateAssetStrategy(
110: 		        address asset,
111: 		        address strategy
112: 		    )
113: 		        external
114: 		        onlyRole(DEFAULT_ADMIN_ROLE)
115: 		        onlySupportedAsset(asset)

144: 		    function setRSETH(address rsETH_) external onlyRole(DEFAULT_ADMIN_ROLE) {

149: 		    function setToken(bytes32 tokenKey, address assetAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {

165: 		    function setContract(bytes32 contractKey, address contractAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[73](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L73), [94-100](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L94-L100), [109-115](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L109-L115), [144](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L144), [149](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L149), [165](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L165)]



```solidity
File: src/LRTDepositPool.sol

119: 		    function depositAsset(
120: 		        address asset,
121: 		        uint256 depositAmount
122: 		    )
123: 		        external
124: 		        whenNotPaused
125: 		        nonReentrant
126: 		        onlySupportedAsset(asset)

162: 		    function addNodeDelegatorContractToQueue(address[] calldata nodeDelegatorContracts) external onlyLRTAdmin {

183: 		    function transferAssetToNodeDelegator(
184: 		        uint256 ndcIndex,
185: 		        address asset,
186: 		        uint256 amount
187: 		    )
188: 		        external
189: 		        nonReentrant
190: 		        onlyLRTManager
191: 		        onlySupportedAsset(asset)

202: 		    function updateMaxNodeDelegatorCount(uint256 maxNodeDelegatorCount_) external onlyLRTAdmin {

208: 		    function pause() external onlyLRTManager {

213: 		    function unpause() external onlyLRTAdmin {
```
[[119-126](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L119-L126), [162](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L162), [183-191](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L183-L191), [202](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L202), [208](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L208), [213](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L213)]



```solidity
File: src/LRTOracle.sol

88: 		    function updatePriceOracleFor(
89: 		        address asset,
90: 		        address priceOracle
91: 		    )
92: 		        external
93: 		        onlyLRTManager
94: 		        onlySupportedAsset(asset)

102: 		    function pause() external onlyLRTManager {

107: 		    function unpause() external onlyLRTAdmin {
```
[[88-94](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L88-L94), [102](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L102), [107](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L107)]



```solidity
File: src/NodeDelegator.sol

38: 		    function maxApproveToEigenStrategyManager(address asset)
39: 		        external
40: 		        override
41: 		        onlySupportedAsset(asset)
42: 		        onlyLRTManager

51: 		    function depositAssetIntoStrategy(address asset)
52: 		        external
53: 		        override
54: 		        whenNotPaused
55: 		        nonReentrant
56: 		        onlySupportedAsset(asset)
57: 		        onlyLRTManager

74: 		    function transferBackToLRTDepositPool(
75: 		        address asset,
76: 		        uint256 amount
77: 		    )
78: 		        external
79: 		        whenNotPaused
80: 		        nonReentrant
81: 		        onlySupportedAsset(asset)
82: 		        onlyLRTManager

127: 		    function pause() external onlyLRTManager {

132: 		    function unpause() external onlyLRTAdmin {
```
[[38-42](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L38-L42), [51-57](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L51-L57), [74-82](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L74-L82), [127](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L127), [132](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L132)]



```solidity
File: src/RSETH.sol

47: 		    function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) whenNotPaused {

54: 		    function burnFrom(address account, uint256 amount) external onlyRole(BURNER_ROLE) whenNotPaused {

60: 		    function pause() external onlyLRTManager {

66: 		    function unpause() external onlyRole(DEFAULT_ADMIN_ROLE) {

73: 		    function updateLRTConfig(address _lrtConfig) external override onlyRole(DEFAULT_ADMIN_ROLE) {
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L47), [54](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L54), [60](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L60), [66](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L66), [73](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L73)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

45: 		    function updatePriceFeedFor(address asset, address priceFeed) external onlyLRTManager onlySupportedAsset(asset) {
```
[[45](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L45)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

47: 		    function updateLRTConfig(address lrtConfigAddr) external virtual onlyLRTAdmin {
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L47)]

</details>

---

### [G-11] Add `unchecked` blocks for divisions where the operands cannot overflow

`uint` divisions can't overflow, while `int` divisions can overflow only in [one specific case](https://docs.soliditylang.org/en/latest/types.html#division).

Consider adding an `unchecked` block to have some [gas savings](https://gist.github.com/DadeKuma/3bc597338ae774b8b3bd43280d55271f).

*There are 2 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

109: 		        rsethAmountToMint = (amount * lrtOracle.getAssetPrice(asset)) / lrtOracle.getRSETHPrice();
```
[[109](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L109)]



```solidity
File: src/LRTOracle.sol

78: 		        return totalETHInPool / rsEthSupply;
```
[[78](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L78)]


---

### [G-12] Usage of `uints`/`ints` smaller than 32 bytes (256 bits) incurs overhead

Citing the [documentation](https://docs.soliditylang.org/en/latest/internals/layout_in_storage.html):

> When using elements that are smaller than 32 bytes, your contract’s gas usage may be higher.This is because the EVM operates on 32 bytes at a time.Therefore, if the element is smaller than that, the EVM must use more operations in order to reduce the size of the element from 32 bytes to the desired size.

For example, each operation involving a `uint8` costs an extra ** 22 - 28 gas ** (depending on whether the other operand is also a variable of type `uint8`) as compared to ones involving`uint256`, due to the compiler having to clear the higher bits of the memory word before operating on the`uint8`, as well as the associated stack operations of doing so.

Note that it might be beneficial to use reduced-size types when dealing with storage values because the compiler will pack multiple elements into one storage slot, but if not, it will have the opposite effect.

*There is 1 instance of this issue.*


```solidity
File: src/LRTOracle.sol

66: 		        for (uint16 asset_idx; asset_idx < supportedAssetCount;) {
```
[[66](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L66)]


---

### [G-13] Stack variable cost less while used in emiting event

Using a stack variable instead of a state variable is cheaper when emitting an event.

*There is 1 instance of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit maxNodeDelegatorCount
204: 		        emit MaxNodeDelegatorCountUpdated(maxNodeDelegatorCount);
```
[[204](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L204)]


---

### [G-14] `>=`/`<=` costs less gas than `>`/`<`

The compiler uses opcodes `GT` and `ISZERO` for code that uses `>`, but only requires `LT` for `>=`. A similar behaviour applies for `>`, which uses opcodes `LT` and `ISZERO`, but only requires `GT` for `<=`.

*There are 6 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

82: 		        for (uint256 i; i < ndcsCount;) {

132: 		        if (depositAmount > getAssetCurrentLimit(asset)) {

164: 		        if (nodeDelegatorQueue.length + length > maxNodeDelegatorCount) {

168: 		        for (uint256 i; i < length;) {
```
[[82](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L82), [132](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L132), [164](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L164), [168](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L168)]



```solidity
File: src/LRTOracle.sol

66: 		        for (uint16 asset_idx; asset_idx < supportedAssetCount;) {
```
[[66](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L66)]



```solidity
File: src/NodeDelegator.sol

109: 		        for (uint256 i = 0; i < strategiesLength;) {
```
[[109](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L109)]


---

### [G-15] Inline `modifiers` that are only used once, to save gas

Consider removing the following modifiers, and put the logic directly in the function where they are used, as they are used only once.

*There is 1 instance of this issue.*


```solidity
File: src/utils/LRTConfigRoleChecker.sol

27: 		    modifier onlyLRTAdmin() {
28: 		        bytes32 DEFAULT_ADMIN_ROLE = 0x00;
29: 		        if (!IAccessControl(address(lrtConfig)).hasRole(DEFAULT_ADMIN_ROLE, msg.sender)) {
30: 		            revert ILRTConfig.CallerNotLRTConfigAdmin();
31: 		        }
32: 		        _;
33: 		    }
```
[[27-33](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L27-L33)]


---

### [G-16] `private` functions only called once can be inlined to save gas

Consider removing the following private functions, and put the logic directly where they are called, as they are called only once.

*There are 2 instances of this issue.*


```solidity
File: src/LRTConfig.sol

172: 		    function _setContract(bytes32 key, address val) private {
```
[[172](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L172)]



```solidity
File: src/LRTDepositPool.sol

151: 		    function _mintRsETH(address _asset, uint256 _amount) private returns (uint256 rsethAmountToMint) {
```
[[151](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L151)]


---

### [G-17] Unused named return variables without optimizer waste gas

Consider changing the variable to be an unnamed one, since the variable is never assigned, nor is it returned by name. If the optimizer is not turned on, leaving the code as it is will also waste gas for the stack variable.

*There are 2 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

// @audit uint256 totalAssetDeposit
47: 		    function getTotalAssetDeposits(address asset) public view override returns (uint256 totalAssetDeposit) {
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L47)]



```solidity
File: src/LRTOracle.sol

// @audit uint256 rsETHPrice
52: 		    function getRSETHPrice() external view returns (uint256 rsETHPrice) {
```
[[52](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L52)]


---

### [G-18] Function names can be optimized

Function that are `public`/`external` and `public` state variable names can be optimized to save gas.

Method IDs that have two leading zero bytes can save **128 gas** each during deployment, and renaming functions to have lower method IDs will save **22 gas** per call, per sorted position shifted. [Reference](https://blog.emn178.cc/en/post/solidity-gas-optimization-function-name/)

*There are 8 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

12: 		contract LRTConfig is ILRTConfig, AccessControlUpgradeable {
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L12)]



```solidity
File: src/LRTDepositPool.sol

19: 		contract LRTDepositPool is ILRTDepositPool, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L19)]



```solidity
File: src/LRTOracle.sol

19: 		contract LRTOracle is ILRTOracle, LRTConfigRoleChecker, PausableUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L19)]



```solidity
File: src/NodeDelegator.sol

18: 		contract NodeDelegator is INodeDelegator, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[18](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L18)]



```solidity
File: src/RSETH.sol

14: 		contract RSETH is
```
[[14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L14)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

11: 		interface AggregatorInterface {

17: 		contract ChainlinkPriceOracle is IPriceFetcher, LRTConfigRoleChecker, Initializable {
```
[[11](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L11), [17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L17)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

13: 		abstract contract LRTConfigRoleChecker {
```
[[13](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L13)]

</details>

---

### [G-19] Avoid zero transfers calls

Emit any transfer events if the EIP requires it, but avoid doing the actual call when the amount is zero.

*There are 3 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

136: 		        if (!IERC20(asset).transferFrom(msg.sender, address(this), depositAmount)) {

194: 		        if (!IERC20(asset).transfer(nodeDelegator, amount)) {
```
[[136](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L136), [194](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L194)]



```solidity
File: src/NodeDelegator.sol

86: 		        if (!IERC20(asset).transfer(lrtDepositPool, amount)) {
```
[[86](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L86)]


---

### [G-20] Constructors can be marked `payable`

`payable` functions cost less gas to execute, since the compiler does not have to add extra checks to ensure that a payment wasn't provided.

A `constructor` can safely be marked as `payable`, since only the deployer would be able to pass funds, and the project itself would not pass any funds.

*There are 6 instances of this issue.*


```solidity
File: src/LRTConfig.sol

24: 		    constructor() {
```
[[24](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L24)]



```solidity
File: src/LRTDepositPool.sol

25: 		    constructor() {
```
[[25](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L25)]



```solidity
File: src/LRTOracle.sol

23: 		    constructor() {
```
[[23](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L23)]



```solidity
File: src/NodeDelegator.sol

20: 		    constructor() {
```
[[20](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L20)]



```solidity
File: src/RSETH.sol

25: 		    constructor() {
```
[[25](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L25)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

21: 		    constructor() {
```
[[21](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L21)]


---

### [G-21] Use assembly to check for `address(0)`

A simple zero address check can be written in assembly to save some gas.

*There is 1 instance of this issue.*


```solidity
File: src/utils/UtilLib.sol

12: 		        if (address_ == address(0)) revert ZeroAddressNotAllowed();
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/UtilLib.sol#L12)]


---

### [G-22] Use assembly to validate `msg.sender`

It is possible to use assembly to efficiently validate `msg.sender` with the least amount of opcodes. For more details check the [following report](https://code4rena.com/reports/2023-05-juicebox#g-06-use-assembly-to-validate-msgsender).

*There are 3 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

136: 		        if (!IERC20(asset).transferFrom(msg.sender, address(this), depositAmount)) {
```
[[136](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L136)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

21: 		        if (!IAccessControl(address(lrtConfig)).hasRole(LRTConstants.MANAGER, msg.sender)) {

29: 		        if (!IAccessControl(address(lrtConfig)).hasRole(DEFAULT_ADMIN_ROLE, msg.sender)) {
```
[[21](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L21), [29](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L29)]


---

### [G-23] Use assembly to write `address` storage values

Using assembly `{ sstore(state.slot, addr)` instead of `state = addr` can save gas.

*There are 3 instances of this issue.*


```solidity
File: src/LRTConfig.sol

67: 		        rsETH = rsETH_;

146: 		        rsETH = rsETH_;
```
[[67](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L67), [146](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L146)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

49: 		        lrtConfig = ILRTConfig(lrtConfigAddr);
```
[[49](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L49)]


---

### [G-24] Use assembly to emit an `event`

To efficiently emit events, it's possible to utilize assembly by making use of scratch space and the free memory pointer. This approach has the advantage of potentially avoiding the costs associated with memory expansion.

However, it's important to note that in order to safely optimize this process, it is preferable to cache and restore the free memory pointer.

A good example of such practice can be seen in [Solady's](https://github.com/Vectorized/solady/blob/main/src/tokens/ERC1155.sol#L167) codebase.

*There are 17 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

88: 		        emit AddedNewSupportedAsset(asset, depositLimit);

103: 		        emit AssetDepositLimitUpdate(asset, depositLimit);

162: 		        emit SetToken(key, val);

178: 		        emit SetContract(key, val);
```
[[88](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L88), [103](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L103), [162](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L162), [178](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L178)]



```solidity
File: src/LRTDepositPool.sol

37: 		        emit UpdatedLRTConfig(lrtConfigAddr);

143: 		        emit AssetDeposit(asset, depositAmount, rsethAmountMinted);

171: 		            emit NodeDelegatorAddedinQueue(nodeDelegatorContracts[i]);

204: 		        emit MaxNodeDelegatorCountUpdated(maxNodeDelegatorCount);
```
[[37](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L37), [143](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L143), [171](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L171), [204](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L204)]



```solidity
File: src/LRTOracle.sol

34: 		        emit UpdatedLRTConfig(lrtConfigAddr);

98: 		        emit AssetPriceOracleUpdate(asset, priceOracle);
```
[[34](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L34), [98](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L98)]



```solidity
File: src/NodeDelegator.sol

32: 		        emit UpdatedLRTConfig(lrtConfigAddr);

65: 		        emit AssetDepositIntoStrategy(asset, strategy, balance);
```
[[32](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L32), [65](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L65)]



```solidity
File: src/RSETH.sol

41: 		        emit UpdatedLRTConfig(lrtConfigAddr);

76: 		        emit UpdatedLRTConfig(_lrtConfig);
```
[[41](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L41), [76](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L76)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

31: 		        emit UpdatedLRTConfig(lrtConfig_);

48: 		        emit AssetPriceFeedUpdate(asset, priceFeed);
```
[[31](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L31), [48](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L48)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

50: 		        emit UpdatedLRTConfig(lrtConfigAddr);
```
[[50](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L50)]

</details>

---

## Disputed Issues

---

### [D-01] It's possible to mint to `address(0)`

This issue is invalid as there are checks to avoid it.

*There is 1 instance of this issue.*


```solidity
File: src/RSETH.sol

47: 		    function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) whenNotPaused {
48: 		        _mint(to, amount);
49: 		    }
```
[[47-49](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L47-L49)]


---

### [D-02] Missing checks for `address(0)` in constructor/initializers

This issue is invalid as there are checks to avoid it.

*There are 6 instances of this issue.*


```solidity
File: src/LRTConfig.sol

// @audit rsETH_
67: 		        rsETH = rsETH_;
```
[[67](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L67)]



```solidity
File: src/LRTDepositPool.sol

// @audit lrtConfigAddr
36: 		        lrtConfig = ILRTConfig(lrtConfigAddr);
```
[[36](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L36)]



```solidity
File: src/LRTOracle.sol

// @audit lrtConfigAddr
33: 		        lrtConfig = ILRTConfig(lrtConfigAddr);
```
[[33](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L33)]



```solidity
File: src/NodeDelegator.sol

// @audit lrtConfigAddr
31: 		        lrtConfig = ILRTConfig(lrtConfigAddr);
```
[[31](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L31)]



```solidity
File: src/RSETH.sol

// @audit lrtConfigAddr
40: 		        lrtConfig = ILRTConfig(lrtConfigAddr);
```
[[40](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L40)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

// @audit lrtConfig_
30: 		        lrtConfig = ILRTConfig(lrtConfig_);
```
[[30](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L30)]


---

### [D-03] Missing checks for `address(0)` when updating state variables

This issue is invalid as there are checks to avoid it.

*There are 13 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

// @audit asset
85: 		        isSupportedAsset[asset] = true;

// @audit asset
102: 		        depositLimitByAsset[asset] = depositLimit;

// @audit asset
121: 		        assetStrategy[asset] = strategy;

// @audit strategy
121: 		        assetStrategy[asset] = strategy;

// @audit rsETH_
146: 		        rsETH = rsETH_;

// @audit val
161: 		        tokenMap[key] = val;

// @audit val
177: 		        contractMap[key] = val;
```
[[85](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L85), [102](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L102), [121](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L121), [121](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L121), [146](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L146), [161](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L161), [177](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L177)]



```solidity
File: src/LRTOracle.sol

// @audit asset
97: 		        assetPriceOracle[asset] = priceOracle;

// @audit priceOracle
97: 		        assetPriceOracle[asset] = priceOracle;
```
[[97](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L97), [97](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L97)]



```solidity
File: src/RSETH.sol

// @audit _lrtConfig
75: 		        lrtConfig = ILRTConfig(_lrtConfig);
```
[[75](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L75)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

// @audit asset
47: 		        assetPriceFeed[asset] = priceFeed;

// @audit priceFeed
47: 		        assetPriceFeed[asset] = priceFeed;
```
[[47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L47), [47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L47)]



```solidity
File: src/utils/LRTConfigRoleChecker.sol

// @audit lrtConfigAddr
49: 		        lrtConfig = ILRTConfig(lrtConfigAddr);
```
[[49](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/utils/LRTConfigRoleChecker.sol#L49)]

</details>

---

### [D-04] Enum values should be used in place of constant array indexes

The following instances are not numbers and thus they are invalid.

*There are 28 instances of this issue.*

<details>
<summary>Expand findings</summary>


```solidity
File: src/LRTConfig.sol

29: 		        if (!isSupportedAsset[asset]) {

82: 		        if (isSupportedAsset[asset]) {

85: 		        isSupportedAsset[asset] = true;

87: 		        depositLimitByAsset[asset] = depositLimit;

102: 		        depositLimitByAsset[asset] = depositLimit;

118: 		        if (assetStrategy[asset] == strategy) {

121: 		        assetStrategy[asset] = strategy;

128: 		        return tokenMap[tokenKey];

132: 		        return contractMap[contractKey];

158: 		        if (tokenMap[key] == val) {

161: 		        tokenMap[key] = val;

174: 		        if (contractMap[key] == val) {

177: 		        contractMap[key] = val;
```
[[29](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L29), [82](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L82), [85](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L85), [87](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L87), [102](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L102), [118](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L118), [121](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L121), [128](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L128), [132](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L132), [158](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L158), [161](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L161), [174](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L174), [177](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L177)]



```solidity
File: src/LRTDepositPool.sol

83: 		            assetLyingInNDCs += IERC20(asset).balanceOf(nodeDelegatorQueue[i]);

84: 		            assetStakedInEigenLayer += INodeDelegator(nodeDelegatorQueue[i]).getAssetBalance(asset);

169: 		            UtilLib.checkNonZeroAddress(nodeDelegatorContracts[i]);

170: 		            nodeDelegatorQueue.push(nodeDelegatorContracts[i]);

171: 		            emit NodeDelegatorAddedinQueue(nodeDelegatorContracts[i]);

193: 		        address nodeDelegator = nodeDelegatorQueue[ndcIndex];
```
[[83](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L83), [84](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L84), [169](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L169), [170](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L170), [171](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L171), [193](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L193)]



```solidity
File: src/LRTOracle.sol

46: 		        return IPriceFetcher(assetPriceOracle[asset]).getAssetPrice(asset);

67: 		            address asset = supportedAssets[asset_idx];

97: 		        assetPriceOracle[asset] = priceOracle;
```
[[46](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L46), [67](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L67), [97](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L97)]



```solidity
File: src/NodeDelegator.sol

110: 		            assets[i] = address(IStrategy(strategies[i]).underlyingToken());

110: 		            assets[i] = address(IStrategy(strategies[i]).underlyingToken());

111: 		            assetBalances[i] = IStrategy(strategies[i]).userUnderlyingView(address(this));

111: 		            assetBalances[i] = IStrategy(strategies[i]).userUnderlyingView(address(this));
```
[[110](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L110), [110](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L110), [111](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L111), [111](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L111)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

38: 		        return AggregatorInterface(assetPriceFeed[asset]).latestAnswer();

47: 		        assetPriceFeed[asset] = priceFeed;
```
[[38](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L38), [47](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L47)]

</details>

---

### [D-05] Missing `initializer` modifier

The general rule is true, but the following instances are invalid.

*There are 4 instances of this issue.*


```solidity
File: src/LRTDepositPool.sol

19: 		contract LRTDepositPool is ILRTDepositPool, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L19)]



```solidity
File: src/NodeDelegator.sol

18: 		contract NodeDelegator is INodeDelegator, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[18](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L18)]



```solidity
File: src/RSETH.sol

15: 		    Initializable,
```
[[15](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L15)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

17: 		contract ChainlinkPriceOracle is IPriceFetcher, LRTConfigRoleChecker, Initializable {
```
[[17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L17)]


---

### [D-06] Upgradeable contract is missing a constructor that disables initialization

The general rule is true, but the following instances are invalid.

*There are 6 instances of this issue.*


```solidity
File: src/LRTConfig.sol

// @audit has call on line 25
12: 		contract LRTConfig is ILRTConfig, AccessControlUpgradeable {
```
[[12](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTConfig.sol#L12)]



```solidity
File: src/LRTDepositPool.sol

// @audit has call on line 26
19: 		contract LRTDepositPool is ILRTDepositPool, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTDepositPool.sol#L19)]



```solidity
File: src/LRTOracle.sol

// @audit has call on line 24
19: 		contract LRTOracle is ILRTOracle, LRTConfigRoleChecker, PausableUpgradeable {
```
[[19](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/LRTOracle.sol#L19)]



```solidity
File: src/NodeDelegator.sol

// @audit has call on line 21
18: 		contract NodeDelegator is INodeDelegator, LRTConfigRoleChecker, PausableUpgradeable, ReentrancyGuardUpgradeable {
```
[[18](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/NodeDelegator.sol#L18)]



```solidity
File: src/RSETH.sol

// @audit has call on line 26
14: 		contract RSETH is
```
[[14](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/RSETH.sol#L14)]



```solidity
File: src/oracles/ChainlinkPriceOracle.sol

// @audit not upgreadable
17: 		contract ChainlinkPriceOracle is IPriceFetcher, LRTConfigRoleChecker, Initializable {
```
[[17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L17)]


---

### [D-07] Upgradeable contract is missing a gap storage variable

The general rule is true, but the following instances are invalid.

*There is 1 instance of this issue.*


```solidity
File: src/oracles/ChainlinkPriceOracle.sol

// @audit not upgreadable
17: 		contract ChainlinkPriceOracle is IPriceFetcher, LRTConfigRoleChecker, Initializable {
```
[[17](https://github.com/code-423n4/2023-11-kelp/blob/4b34abc952205e2a34bff893a0de0c75b8052149/src/oracles/ChainlinkPriceOracle.sol#L17)]


---

### [D-08] Modifier order does not comply with best practices

The general rule is true, but every in-scope function follows the recommended order:

1. Visibility
2. Mutability
3. Virtual
4. Override
5. Custom modifiers



---

### [D-09] Visibility should be set explicitly rather than defaulting to internal

The general rule is true, but there aren't any variables that use the default visibility.



---

### [D-10] Consider using named mappings

The general rule is true, but all the in-scope mappings are already using this feature.



---
