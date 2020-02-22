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
        <testerBytecode> .ByteArray </testerBytecode>
        <erc20Bytecode> .ByteArray </erc20Bytecode>
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
    rule <k> #loadTesterBytecode => #loadBytecode ?ACCT CODE ...</k>
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

endmodule
```
