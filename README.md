# Basic fungible token with ownership

If you want to change token parameters, you should change args in sources/token.move initialize function (name, symbol, decimals)

To use modules and scripts you should have aptos cli, to use js scripts you should have node

Compile modules and scripts
```sh
aptos move compile --named-addresses owner=<address>
```
For example
```sh
aptos move compile --named-addresses owner=0x896f3d6e08e543e1408aaf6a83d7fa9335457ff94c16bd7a34bdd165d7f475f4
```

Publish token (with default account)
```sh
aptos move publish
```
If you want to deploy from another private key, set either --private-key or --profile


Initialize published token
```sh
aptos move run --function-id <address>::Token::initialize
```
For example
```sh
aptos move run --function-id 896f3d6e08e543e1408aaf6a83d7fa9335457ff94c16bd7a34bdd165d7f475f4::Token::initialize::Token::initialize
```

Register an account in token module (initialize token resource)
```sh
aptos move run-script --compiled-script-path build/Token/bytecode_scripts/main_1.mv
```

Mint tokens (must be called either from owner account or with owner private key)
```sh
aptos move run-script --compiled-script-path build/Token/bytecode_scripts/main_0.mv --profile default --args address:<to address> u64:<amount>
```
For example
```sh
aptos move run-script --compiled-script-path build/Token/bytecode_scripts/main_0.mv --profile default --args address:0xec6644714a66243b93f60d4054dbd55e9373835ca10aa289d0593f65ee1dd05a u64:10000000
```

Get token balance of a given address
(Check package.json show_balance script)
For example with pnpm:
```sh
pnpm show_balance 0x896f3d6e08e543e1408aaf6a83d7fa9335457ff94c16bd7a34bdd165d7f475f4 0xec6644714a66243b93f60d4054dbd55e9373835ca10aa289d0593f65ee1dd05a
```

Transfer tokens
```sh
aptos move run-script --compiled-script-path build/Token/bytecode_scripts/main_2.mv --profile <from> --args address:<to> u64:<amount>
```
For example
```sh
aptos move run-script --compiled-script-path build/Token/bytecode_scripts/main_2.mv --profile default --args address:0xec6644714a66243b93f60d4054dbd55e9373835ca10aa289d0593f65ee1dd05a u64:5000
```
