Symbolic testing
====================

```k
requires "edsl.k"

module EVM-SYMB-TESTING
    imports EDSL

    configuration
      <kevm-specs>
        <kevm/>
        <testerAcctId> 0 </testerAcctId>
        <testerBytecode> #parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680632387e9751461006757806391b7b928146100be578063c2d56e53146100d5578063f02ce8091461012c575b600080fd5b34801561007357600080fd5b5061007c610157565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156100ca57600080fd5b506100d361015f565b005b3480156100e157600080fd5b506100ea610205565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561013857600080fd5b5061014161020d565b6040518082815260200191505060405180910390f35b600080905090565b60003073ffffffffffffffffffffffffffffffffffffffff16632387e9756040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b1580156101c557600080fd5b505af11580156101d9573d6000803e3d6000fd5b505050506040513d60208110156101ef57600080fd5b8101908080519060200190929190505050905050565b600080905090565b60008090509056fea165627a7a7230582074e863a2de88d7beb8eed4a5c4123edfd076e328c509bc1c7984aed5ddad05c00029") </testerBytecode>
        <erc20Bytecode>  #parseByteStack("0x60606040526004361061006d576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063095ea7b31461007257806323b872dd146100cc57806370a0823114610145578063a9059cbb14610192578063dd62ed3e146101ec575b600080fd5b341561007d57600080fd5b6100b2600480803573ffffffffffffffffffffffffffffffffffffffff16906020019091908035906020019091905050610258565b604051808215151515815260200191505060405180910390f35b34156100d757600080fd5b61012b600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061034a565b604051808215151515815260200191505060405180910390f35b341561015057600080fd5b61017c600480803573ffffffffffffffffffffffffffffffffffffffff169060200190919050506105c6565b6040518082815260200191505060405180910390f35b341561019d57600080fd5b6101d2600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061060f565b604051808215151515815260200191505060405180910390f35b34156101f757600080fd5b610242600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff16906020019091905050610778565b6040518082815260200191505060405180910390f35b600081600260003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925846040518082815260200191505060405180910390a36001905092915050565b600081600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410158015610417575081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410155b80156104235750600082115b156105ba5781600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254019250508190555081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825403925050819055508273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a3600190506105bf565b600090505b9392505050565b6000600160008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050919050565b600081600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054101580156106605750600082115b1561076d5781600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825401925050819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a360019050610772565b600090505b92915050565b6000600260008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050929150505600a165627a7a723058206cb5284e8795f7d1c570318732bc1cb8add2222946156c0ba28c946531c4a2f50029") </erc20Bytecode>
      </kevm-specs>

    syntax EthereumSimulation ::= ".EthereumSimulation"
                                | EthereumCommand EthereumSimulation

    //Shortcut for #mkCall and required setup
    syntax EthereumCommand ::= "#mkCallShortcut" Int Int ByteArray
    rule <k> #mkCallShortcut CALLER_ID ACCT_ID ARGS
          => #mkCall CALLER_ID ACCT_ID ACCT_ID PARSEDCODE 0 ARGS false
         ...
         </k>
        <acctID> ACCT_ID </acctID>
        <code> PARSEDCODE </code>

    syntax EthereumCommand ::= "#loadTesterBytecode"
                             | "#loadERC20Bytecode" Int
                             | "#loadBytecode" Int ByteArray
    rule <k> #loadTesterBytecode => #loadBytecode ?ACCT:Int CODE ...</k>
         <testerBytecode> CODE </testerBytecode>
         <testerAcctId> _ => ?ACCT </testerAcctId>

    rule <k> #loadERC20Bytecode ACCT => #loadBytecode ACCT CODE ...</k>
         <erc20Bytecode> CODE </erc20Bytecode>

    rule <k> #loadBytecode ACCT CODE => . ...</k>
         <activeAccounts> ACCTS:Set (.Set => SetItem(ACCT)) </activeAccounts>
         <accounts>
           ( .Bag
          => <account>
               <acctID> ACCT </acctID>
               <code> CODE </code>
               ...
             </account>
           )
           ...
         </accounts>

    //Implementation of new_ERC20_with_arbitrary_storage() returns address
    rule <k> CALL _ ACCTTO 0 ARGSTART ARGWIDTH RETSTART RETWIDTH
          => #assume #rangeAddress(?ACCT:Int)
          ~> #loadERC20Bytecode ?ACCT
          ~> #setLocalMem RETSTART RETWIDTH #buf(32, ?ACCT)
         ...
         </k>
         <localMem> LM </localMem>
         <testerAcctId> ACCTTO </testerAcctId>
      requires #range(LM, ARGSTART, ARGWIDTH) ==K #abiCallData("new_ERC20_with_arbitrary_storage", .TypedArgs)

    //Implementation of create_symbolic_address() returns address
    rule <k> CALL _ ACCTTO 0 ARGSTART ARGWIDTH RETSTART RETWIDTH
          => #assume #rangeAddress(?ACCT:Int)
          ~> #setLocalMem RETSTART RETWIDTH #buf(32, ?ACCT)
         ...
         </k>
         <localMem> LM </localMem>
         <testerAcctId> ACCTTO </testerAcctId>
      requires #range(LM, ARGSTART, ARGWIDTH) ==K #abiCallData("create_symbolic_address", .TypedArgs)

    //Implementation of create_symbolic_uint256() returns address
    rule <k> CALL _ ACCTTO 0 ARGSTART ARGWIDTH RETSTART RETWIDTH
          => #assume #rangeUInt(256, ?SYMB_INT:Int)
          ~> #setLocalMem RETSTART RETWIDTH #buf(32, ?SYMB_INT)
         ...
         </k>
         <localMem> LM </localMem>
         <testerAcctId> ACCTTO </testerAcctId>
      requires #range(LM, ARGSTART, ARGWIDTH) ==K #abiCallData("create_symbolic_uint256", .TypedArgs)

    syntax Set ::= "#customFunctionAbis" [function]
    rule #customFunctionAbis => SetItem(#abiCallData("new_ERC20_with_arbitrary_storage", .TypedArgs))
                                SetItem(#abiCallData("create_symbolic_address", .TypedArgs))
                                SetItem(#abiCallData("create_symbolic_uint256", .TypedArgs))

    //todo temporary hack untin we get priorities working
    rule <k> CALL GCAP ACCTTO VALUE ARGSTART ARGWIDTH RETSTART RETWIDTH
          => #checkCall ACCTFROM VALUE
          ~> #call ACCTFROM ACCTTO ACCTTO VALUE VALUE #range(LM, ARGSTART, ARGWIDTH) false
          ~> #return RETSTART RETWIDTH
         ...
         </k>
         <schedule> SCHED </schedule>
         <id> ACCTFROM </id>
         <localMem> LM </localMem>
      requires notBool ( #range(LM, ARGSTART, ARGWIDTH) in #customFunctionAbis )

    syntax EthereumCommand ::= "#assume" Bool
    rule <k> #assume B => . ...</k>
      ensures B

    syntax EthereumCommand ::= "#runTestApprove"
                             | "#runTestApproveAux"

    rule <k> #runTestApprove => #loadTesterBytecode ~> #runTestApproveAux ~> success ...</k>
    rule <k> #runTestApproveAux => #mkCallShortcut 0 TESTER_ACCT #abiCallData("test_approve", .TypedArgs) ...</k>
         <testerAcctId> TESTER_ACCT </testerAcctId>

endmodule
```
