requires "symb-test-verification.k"

module DEMOSYMBTEST-SPEC
  imports SYMB-TEST-VERIFICATION

  rule
  <kevm-specs>
    <kevm>
    <k> #runTestApprove => . </k>
    <exit-code> _ => ?_ </exit-code>
    <mode> NORMAL </mode>
    <schedule> ISTANBUL </schedule>

    <ethereum>
      <evm>
        <output> _ => ?_ </output>
        <statusCode> _ => ?_ </statusCode>
        //<callStack> _ </callStack> //todo this version doesn't work: https://github.com/kframework/kore/issues/1677
        //<callStack> _:List </callStack> //Also doesn't work
        <callStack> .List </callStack> //This version works
        <interimStates> .List </interimStates> //Same limitations as for <callStack>
        <touchedAccounts> .Set => ?_ </touchedAccounts>

        <callState>
          <program> .ByteArray </program>
          <jumpDests> .Set </jumpDests>

          <id> .Account </id> // contract owner
          <caller> .Account </caller> // who called this contract; in the begining, origin // msg.sender

          <callData> .ByteArray </callData>

          <callValue> 0 </callValue>
          <wordStack> .WordStack => ?_ </wordStack>
          <localMem> .Memory => ?_ </localMem>
          <pc> 0 => ?_ </pc>
          <gas> 100000 => ?_ </gas>
          <memoryUsed> 0 => ?_ </memoryUsed>
          <callGas> _ => ?_ </callGas>

          <static> false </static> // NOTE: non-static call
          <callDepth> 0 </callDepth>
        </callState>

        <substate>
          <selfDestruct> _ </selfDestruct>
          <log> _ </log>
          <refund> _ </refund> // TODO: more detail
        </substate>

        <gasPrice> _ </gasPrice>
        <origin> ORIGIN_ID </origin> // who fires tx
        ...
      </evm>

      <network>
        <chainID> _ </chainID>

        <activeAccounts> .Set => ?_ </activeAccounts>

        <accounts>
          //v1: gets stuch at #runTestApproveAux
          /*<account>
            <acctID>      0                      </acctID>
            <balance>     0                      </balance>
            <code>        .ByteArray:AccountCode </code>
            <storage>     .Map                   </storage>
            <origStorage> .Map                   </origStorage>
            <nonce>       0                      </nonce>
          </account> => ?_*/
          .Bag => ?_
        </accounts>

        <txOrder> _ </txOrder>
        <txPending> _ </txPending>
        <messages> _ </messages>
      </network>
    </ethereum>
    </kevm>
    <testerAcctId> 0 => ?_ </testerAcctId>
    <testerBytecode> #parseByteStack("0x60806040526004361061006d576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680632387e975146100725780634c63e562146100c957806391b7b92814610106578063c2d56e531461011d578063f02ce80914610174575b600080fd5b34801561007e57600080fd5b5061008761019f565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156100d557600080fd5b50610104600480360360208110156100ec57600080fd5b810190808035151590602001909291905050506101a7565b005b34801561011257600080fd5b5061011b6101aa565b005b34801561012957600080fd5b50610132610594565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561018057600080fd5b5061018961059c565b6040518082815260200191505060405180910390f35b600080905090565b50565b60003073ffffffffffffffffffffffffffffffffffffffff16632387e9756040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b15801561021057600080fd5b505af1158015610224573d6000803e3d6000fd5b505050506040513d602081101561023a57600080fd5b8101908080519060200190929190505050905060003073ffffffffffffffffffffffffffffffffffffffff1663c2d56e536040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b1580156102b357600080fd5b505af11580156102c7573d6000803e3d6000fd5b505050506040513d60208110156102dd57600080fd5b8101908080519060200190929190505050905060003073ffffffffffffffffffffffffffffffffffffffff1663f02ce8096040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b15801561035657600080fd5b505af115801561036a573d6000803e3d6000fd5b505050506040513d602081101561038057600080fd5b8101908080519060200190929190505050905060008373ffffffffffffffffffffffffffffffffffffffff1663095ea7b384846040518363ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200182815260200192505050602060405180830381600087803b15801561043857600080fd5b505af115801561044c573d6000803e3d6000fd5b505050506040513d602081101561046257600080fd5b81019080805190602001909291905050509050801561058e57818473ffffffffffffffffffffffffffffffffffffffff1663dd62ed3e30866040518363ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019250505060206040518083038186803b15801561054957600080fd5b505afa15801561055d573d6000803e3d6000fd5b505050506040513d602081101561057357600080fd5b810190808051906020019092919050505014151561058d57fe5b5b50505050565b600080905090565b60008090509056fea165627a7a72305820d31d14a0c4d1a0fd308dfbe88af9d2ba7d51feb16fc8d42215cdec254e5381340029") </testerBytecode>
    <erc20Bytecode>  #parseByteStack("0x60606040526004361061006d576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063095ea7b31461007257806323b872dd146100cc57806370a0823114610145578063a9059cbb14610192578063dd62ed3e146101ec575b600080fd5b341561007d57600080fd5b6100b2600480803573ffffffffffffffffffffffffffffffffffffffff16906020019091908035906020019091905050610258565b604051808215151515815260200191505060405180910390f35b34156100d757600080fd5b61012b600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061034a565b604051808215151515815260200191505060405180910390f35b341561015057600080fd5b61017c600480803573ffffffffffffffffffffffffffffffffffffffff169060200190919050506105c6565b6040518082815260200191505060405180910390f35b341561019d57600080fd5b6101d2600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061060f565b604051808215151515815260200191505060405180910390f35b34156101f757600080fd5b610242600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff16906020019091905050610778565b6040518082815260200191505060405180910390f35b600081600260003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925846040518082815260200191505060405180910390a36001905092915050565b600081600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410158015610417575081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410155b80156104235750600082115b156105ba5781600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254019250508190555081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825403925050819055508273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a3600190506105bf565b600090505b9392505050565b6000600160008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050919050565b600081600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054101580156106605750600082115b1561076d5781600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825401925050819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a360019050610772565b600090505b92915050565b6000600260008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050929150505600a165627a7a723058206cb5284e8795f7d1c570318732bc1cb8add2222946156c0ba28c946531c4a2f50029") </erc20Bytecode>
  </kevm-specs>

endmodule

