Symbolic testing
====================

```k
requires "driver.k"
requires "edsl.k"

module EVM-SYMB-TESTING
    imports ETHEREUM-SIMULATION
    imports EDSL

    configuration
      <kevm-specs>
        <kevm/>
        <testerAcctId> 0 </testerAcctId>
        <testerBytecode> #parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680632387e9751461006757806391b7b928146100be578063c2d56e53146100d5578063f02ce8091461012c575b600080fd5b34801561007357600080fd5b5061007c610157565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156100ca57600080fd5b506100d361015f565b005b3480156100e157600080fd5b506100ea61034d565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561013857600080fd5b50610141610355565b6040518082815260200191505060405180910390f35b600080905090565b60003073ffffffffffffffffffffffffffffffffffffffff16632387e9756040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b1580156101c557600080fd5b505af11580156101d9573d6000803e3d6000fd5b505050506040513d60208110156101ef57600080fd5b8101908080519060200190929190505050905060003073ffffffffffffffffffffffffffffffffffffffff1663c2d56e536040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b15801561026857600080fd5b505af115801561027c573d6000803e3d6000fd5b505050506040513d602081101561029257600080fd5b8101908080519060200190929190505050905060003073ffffffffffffffffffffffffffffffffffffffff1663f02ce8096040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b15801561030b57600080fd5b505af115801561031f573d6000803e3d6000fd5b505050506040513d602081101561033557600080fd5b81019080805190602001909291905050509050505050565b600080905090565b60008090509056fea165627a7a7230582015e84f2e5b9780e9f5595ca9c03d510af0456661552e00f350341cf10ea4db420029") </testerBytecode>
        <erc20Bytecode>  #parseByteStack("0x60606040526004361061006d576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063095ea7b31461007257806323b872dd146100cc57806370a0823114610145578063a9059cbb14610192578063dd62ed3e146101ec575b600080fd5b341561007d57600080fd5b6100b2600480803573ffffffffffffffffffffffffffffffffffffffff16906020019091908035906020019091905050610258565b604051808215151515815260200191505060405180910390f35b34156100d757600080fd5b61012b600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061034a565b604051808215151515815260200191505060405180910390f35b341561015057600080fd5b61017c600480803573ffffffffffffffffffffffffffffffffffffffff169060200190919050506105c6565b6040518082815260200191505060405180910390f35b341561019d57600080fd5b6101d2600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061060f565b604051808215151515815260200191505060405180910390f35b34156101f757600080fd5b610242600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff16906020019091905050610778565b6040518082815260200191505060405180910390f35b600081600260003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925846040518082815260200191505060405180910390a36001905092915050565b600081600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410158015610417575081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410155b80156104235750600082115b156105ba5781600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254019250508190555081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825403925050819055508273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a3600190506105bf565b600090505b9392505050565b6000600160008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050919050565b600081600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054101580156106605750600082115b1561076d5781600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825401925050819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a360019050610772565b600090505b92915050565b6000600260008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050929150505600a165627a7a723058206cb5284e8795f7d1c570318732bc1cb8add2222946156c0ba28c946531c4a2f50029") </erc20Bytecode>
      </kevm-specs>

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
         <schedule> SCHED </schedule>
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
      ensures #rangeAddress(ACCT)
      andBool notBool ACCT in #precompiledAccounts(SCHED)
      //otherwise <touchedAccounts> gets undefined
      andBool notBool ACCT ==K 0

    //Implementation of new_ERC20_with_arbitrary_storage() returns address
    rule <k> CALL _ TESTER_ACCT 0 ARGSTART ARGWIDTH RETSTART RETWIDTH
          //~> #assume notBool ?ACCT in ActiveAccts //Will work once "in" for symbolic LHS gets implemented.
          => #assumeNotIn(?ACCT, ActiveAccts) //Works modulo issue: https://github.com/kframework/kore/issues/1637
          ~> #loadERC20Bytecode ?ACCT
          ~> 1 ~> #push ~> #setLocalMem RETSTART RETWIDTH #buf(32, ?ACCT)
         ...
         </k>
         <output> _ => #buf(32, ?ACCT) </output>
         <localMem> LM </localMem>
         <testerAcctId> TESTER_ACCT </testerAcctId>
         <activeAccounts> ActiveAccts </activeAccounts>
      requires #range(LM, ARGSTART, ARGWIDTH) ==K #abiCallData("new_ERC20_with_arbitrary_storage", .TypedArgs)

    //Implementation of create_symbolic_address() returns address
    rule <k> CALL _ TESTER_ACCT 0 ARGSTART ARGWIDTH RETSTART RETWIDTH
          => #assume #rangeAddress(?ACCT:Int)
          ~> 1 ~> #push ~> #setLocalMem RETSTART RETWIDTH #buf(32, ?ACCT)
         ...
         </k>
         <output> _ => #buf(32, ?ACCT) </output>
         <localMem> LM </localMem>
         <testerAcctId> TESTER_ACCT </testerAcctId>
      requires #range(LM, ARGSTART, ARGWIDTH) ==K #abiCallData("create_symbolic_address", .TypedArgs)

    //Implementation of create_symbolic_uint256() returns address
    rule <k> CALL _ TESTER_ACCT 0 ARGSTART ARGWIDTH RETSTART RETWIDTH
          => #assume #rangeUInt(256, ?SYMB_INT:Int)
          ~> 1 ~> #push ~> #setLocalMem RETSTART RETWIDTH #buf(32, ?SYMB_INT)
         ...
         </k>
         <output> _ => #buf(32, ?SYMB_INT) </output>
         <localMem> LM </localMem>
         <testerAcctId> TESTER_ACCT </testerAcctId>
      requires #range(LM, ARGSTART, ARGWIDTH) ==K #abiCallData("create_symbolic_uint256", .TypedArgs)

    //assume(bool)
    rule <k> CALL _ TESTER_ACCT 0 ARGSTART ARGWIDTH RETSTART RETWIDTH
          => #assume Bytes2Bool( #range(LM, ARGSTART, ARGWIDTH)[4 .. 32] )
          ~> 1 ~> #push ~> #setLocalMem RETSTART RETWIDTH #buf(32, 0)
         ...
         </k>
         <output> _ => #buf(32, 0) </output>
         <localMem> LM </localMem>
         <testerAcctId> TESTER_ACCT </testerAcctId>
      requires #range(LM, ARGSTART, ARGWIDTH)[0 .. 4] ==K #signatureCallData("assume", #bool(?_), .TypedArgs)

    syntax Bool ::= Bytes2Bool( ByteArray ) [function]
    rule Bytes2Bool(#buf(32, 0)) => false
    rule Bytes2Bool(#buf(32, 1)) => true
    //fixme lemma for actual symbolic form

    syntax Set ::= "#customFunctionAbis" [function, functional]
    rule #customFunctionAbis => SetItem(#signatureCallData("assume", #bool(0), .TypedArgs)) //Argument of #bool(?_) is not used.
                                SetItem(#signatureCallData("new_ERC20_with_arbitrary_storage", .TypedArgs))
                                SetItem(#signatureCallData("create_symbolic_address", .TypedArgs))
                                SetItem(#signatureCallData("create_symbolic_uint256", .TypedArgs))

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
      //todo not evaluated because of https://github.com/kframework/kore/issues/1672
      //requires notBool ( #range(LM, ARGSTART, ARGWIDTH) #in #customFunctionAbis )
      requires #notInByteArrayList(#range(LM, ARGSTART, ARGWIDTH)[0 .. 4], Set2List(#customFunctionAbis) )

    syntax EthereumCommand ::= "#assume" Bool
    rule <k> #assume B => . ...</k>
      ensures B

    syntax EthereumCommand ::= "#runTestApprove"
                             | "#runTestApproveAux"

    rule <k> #runTestApprove => #loadTesterBytecode ~> #runTestApproveAux ~> failure "" ...</k>
    rule <k> #runTestApproveAux => #mkCallShortcut 0 TESTER_ACCT #abiCallData("test_approve", .TypedArgs) ...</k>
         <testerAcctId> TESTER_ACCT </testerAcctId>


    // lemmas
    rule N &Int maxUInt160 => N
      requires #rangeUInt(160, N) [simplification]

    rule maxUInt160 &Int N => N
      requires #rangeUInt(160, N) [simplification]

    rule N modInt pow160 => N
      requires #rangeUInt(160, N) [simplification]

    //todo #in is workaround in case set in operation doesn't work properly. Has no effect, could be "in".
    syntax Bool ::= KItem "#in" Set                                                        [function, functional]
    rule X #in SetItem(A) => X ==K A                                                       [simplification]
    rule X #in SetItem(A) SetItem(B) S:Set => X #in SetItem(A) orBool X #in (SetItem(B) S) [simplification]
    rule X #in .Set => false                                                               [simplification]

    syntax Bool ::= #notInByteArrayList( ByteArray, List ) [function, functional]
    //Cannot rewrite to X =/=K H - custom lemmas for equality don't work.
    //rule #notInByteArrayList(X, ListItem(H:ByteArray) TAIL:List) => X =/=K H andBool #notInByteArrayList(X, TAIL)
    rule #notInByteArrayList(X, ListItem(H:ByteArray) TAIL:List) => #notEq(X, H) andBool #notInByteArrayList(X, TAIL)
    rule #notInByteArrayList(X, .List) => true

    syntax KItem ::= #assumeNotIn( Int, Set )
    rule <k> #assumeNotIn(X, SetItem(H) REST) => #assume X =/=Int H ~> #assumeNotIn(X, REST) ...</k>
    rule <k> #assumeNotIn(X, .Set) => . ...</k>

    //Possibly required, but after this issue: https://github.com/kframework/kore/issues/1672
    rule _ ++ #buf(LEN , _) ==K BA => false
      requires #sizeByteArray(BA) <Int LEN       [simplification]

    syntax Bool ::= #notEq(ByteArray, ByteArray) [function, functional]
    rule #notEq(BA1, BA2) => BA1 =/=K BA2        [concrete]
    rule #notEq(BA, BA) => false

    rule #notEq(_ ++ #buf(LEN , _), BA) => true
      requires #sizeByteArray(BA) <Int LEN       [simplification]

    //todo workaround for Haskell limitation
    rule [#lookup.hack]: #lookup( (KEY |-> VAL)  , KEY ) => VAL [simplification]

endmodule
```