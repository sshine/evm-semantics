pragma solidity ^0.5.0;

import "./test_common.sol";

contract SymbolicTestDemo is SymbolicTestBuiltins {
    function test_approve() external {
        ERC20 token     = SymbolicTestBuiltins(this).new_ERC20_with_arbitrary_storage();
        address spender = SymbolicTestBuiltins(this).create_symbolic_address();
        uint256 value   = SymbolicTestBuiltins(this).create_symbolic_uint256();

        address nonCaller = SymbolicTestBuiltins(this).create_symbolic_address();
        //assume() doesn't work yet
        require(nonCaller != address(this));

        address nonSpender = SymbolicTestBuiltins(this).create_symbolic_address();
        require(nonSpender != spender);
        uint256 otherAllowance = token.allowance(nonCaller, nonSpender);

        bool success = token.approve(spender, value);
        if (success) {
             assert( token.allowance(address(this), spender) == value );
             assert( token.allowance(nonCaller, nonSpender) == otherAllowance ); //Other allowances don't change
        }
    }
}
