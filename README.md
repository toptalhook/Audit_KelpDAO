# Kelp audit details

- Total Prize Pool: $28,000 USDC
  - HM awards: $18,975 USDC
  - Analysis awards: $1,150 USDC
  - QA awards: $575 USDC
  - Bot Race awards: $1,725 USDC
  - Gas awards: $575 USDC
  - Judge awards: $2,760 USDC
  - Lookout awards: $1,740 USDC
  - Scout awards: $500 USDC
- Join [C4 Discord](https://discord.gg/code4rena) to register
- Submit findings [using the C4 form](https://code4rena.com/contests/2023-11-kelp-dao-rseth/submit)
- [Read our guidelines for more details](https://docs.code4rena.com/roles/wardens)
- Starts November 10, 2023 20:00 UTC
- Ends November 15, 2023 20:00 UTC

## Automated Findings / Publicly Known Issues

The 4naly3er report can be found [here](https://github.com/code-423n4/2023-11-kelp/blob/main/4naly3er-report.md).

Automated findings output for the audit can be found [here](https://github.com/code-423n4/2023-11-kelp/blob/main/bot-report.md) within 24 hours of audit opening.

_Note for C4 wardens: Anything included in this `Automated Findings / Publicly Known Issues` section is considered a publicly known issue and is ineligible for awards._

# Overview

Stader Labs has created new contracts for its upcoming Kelp product. The scope of the audit is to review the contracts and ensure that they are secure, resilient, and working as intended.

[LRTConfig](https://github.com/code-423n4/2023-11-kelp/blob/main/src/LRTConfig.sol): An upgradeable contract which is responsible for storing the configuration of the Kelp product. It is also responsible for storing the addresses of the other contracts in the Kelp product.

[LRTepositPool](https://github.com/code-423n4/2023-11-kelp/blob/main/src/LRDepositPool.sol): An upgradeable contract which receives the funds deposited by users into the Kelp product. From here, the funds are transferred to NodeDelegators contracts.

[NodeDelegator](https://github.com/code-423n4/2023-11-kelp/blob/main/src/NodeDelegator.sol): These are contracts that receive funds from the LRDepositPool and delegate them to the EigenLayer strategy. The funds are then used to provide liquidity on the EigenLayer protocol. It is also an upgradeable contract.

[LRTOracle](https://github.com/code-423n4/2023-11-kelp/blob/main/src/LRTOracle.sol): An upgradeable contract which is responsible for fetching the price of Liquid Stasking Tokens tokens from oracle services.

[RSETH](https://github.com/code-423n4/2023-11-kelp/blob/main/src/RSETH.sol): Receipt token for depositing into the Kelp product. It is an upgradeable ERC20 token contract.


Also see [our blog](https://blog.kelpdao.xyz/) for additional info


## Links

See [Linktree](https://linktr.ee/kelpdao)

# Scope

| Contract                                                       | SLOC | Purpose                                                                                  | Libraries used |
| -------------------------------------------------------------- | ---- | ---------------------------------------------------------------------------------------- | -------------- |
| [LRTConfig](https://github.com/code-423n4/2023-11-kelp/blob/main/src/LRTConfig.sol)                               | 111  | Configuration contract                                                                   |
| [LRTDepositPool](https://github.com/code-423n4/2023-11-kelp/blob/main/src/LRTDepositPool.sol)                     | 97   | User interfacing contract when funds are deposited                                       |
| [NodeDelegator](https://github.com/code-423n4/2023-11-kelp/blob/main/src/NodeDelegator.sol)                       | 65   | Recipient of funds from LRTDepositPool. In turn, it sends funds to Eigenlayer strategies |
| [LRTOracle](https://github.com/code-423n4/2023-11-kelp/blob/main/src/LRTOracle.sol)                               | 60   | get prices of liquid staking tokens                                                      |
| [RSETH](https://github.com/code-423n4/2023-11-kelp/blob/main/src/RSETH.sol)                                       | 45   | receipt token user receives upon depositing in LRTDepositPool                            |
| [RSETH](https://github.com/code-423n4/2023-11-kelp/blob/main/src/RSETH.sol)                                       | 45   | receipt token user receives upon depositing in LRTDepositPool                            |
| [ChainlinkPriceOracle](https://github.com/code-423n4/2023-11-kelp/blob/main/src/oracles/ChainlinkPriceOracle.sol) | 25   | wrapper contract to integrate chainlink oracles in LRTOracle                             |
| [LRTConfigRoleChecker](https://github.com/code-423n4/2023-11-kelp/blob/main/src/utils/LRTConfigRoleChecker.sol)   | 33   | Handles role checks                                                                      |
| [UtilLib](https://github.com/code-423n4/2023-11-kelp/blob/main/src/utils/UtilLib.sol)                             | 7    | Helper function lib                                                                      |
| [LRTConstants](https://github.com/code-423n4/2023-11-kelp/blob/main/src/utils/LRTConstants.sol)                   | 10   | shared constant variables                                                                |

It also includes the inherited interface contracts.

## Out of scope

#### Dependencies / External Imports

| Dependency / Import Path                                                 | Count |
| ------------------------------------------------------------------------ | ----- |
| @openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol  | 2     |
| @openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol        | 1     |
| @openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol     | 1     |
| @openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol        | 4     |
| @openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol | 2     |
| @openzeppelin/contracts/access/IAccessControl.sol                        | 1     |
| @openzeppelin/contracts/interfaces/IERC20.sol                            | 3     |
| @openzeppelin/contracts/token/ERC20/IERC20.sol                           | 2     |


# Known Issues

We are aware that EigenLayer has an mechanism to pause deposits in its protocol. Hence we created a layer called NodeDelegator which holds assets and deposits them into EigenLayer asset strategy. The intention is for these NodeDelegator contracts to deposit into Eigenlayer once deposit is available.

# Additional Context

- All core contracts are upgradeable.
- LSTs deposited by users will end up on that LST asset strategy contract in the Eigenlayer protocol

## Scoping Details

```
- If you have a public code repo, please share it here:
- How many contracts are in scope?:   17
- Total SLoC for these contracts?:  504
- How many external imports are there?: 1
- How many separate interfaces and struct definitions are there for the contracts within scope?:  8
- Does most of your code generally use composition or inheritance?:   Inheritance
- How many external calls?:   2
- What is the overall line coverage percentage provided by your tests?: 98
- Is this an upgrade of an existing system?: False
- Check all that apply (e.g. timelock, NFT, AMM, ERC20, rollups, etc.): ERC-20 Token
- Is there a need to understand a separate part of the codebase / get context in order to audit this part of the protocol?: True
- Please describe required context:  Funds are eventually deposited into EigenLayer strategy and we are using Chainlink price oracles for fetching LST prices
- Does it use an oracle?: Chainlink
- Describe any novel or unique curve logic or mathematical models your code uses: N/A
- Is this either a fork of or an alternate implementation of another project?:   False
```

# Tests

```sh
$ forge test
```

### Gas Usage

Get a gas report:

```sh
$ forge test --gas-report
```

### Compile

Compile the contracts:

```sh
$ forge build
```

### Coverage

Get a test coverage report:

```sh
$ forge coverage --report lcov && lcov --remove lcov.info  -o lcov.info 'test/*' 'script/*'
```
