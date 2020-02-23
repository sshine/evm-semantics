pragma solidity ^0.5.0;

contract ERC20 {
    function totalSupply() public view returns (uint supply);
    function balanceOf( address who ) public view returns (uint value);
    function allowance( address owner, address spender ) public view returns (uint _allowance);

    function transfer( address to, uint value) public returns (bool ok);
    function transferFrom( address from, address to, uint value) public returns (bool ok);
    function approve( address spender, uint value ) public returns (bool ok);

    event Transfer( address indexed from, address indexed to, uint value);
    event Approval( address indexed owner, address indexed spender, uint value);
}

contract SymbolicTestBuiltins {
    function new_ERC20_with_arbitrary_storage() external returns (ERC20) { return ERC20(0); }
    function create_symbolic_address() external returns (address) { return address(0); }
    function create_symbolic_uint256() external returns (uint256) { return 0; }
}

contract SymbolicTestDemo is SymbolicTestBuiltins {
    function test_approve() external {
        ERC20 token = SymbolicTestBuiltins(this).new_ERC20_with_arbitrary_storage();
        //address spender = create_symbolic_address();
        //uint256 value = create_symbolic_uint256();
        //bool success = token.approve(spender, value);
        //if (success) {
        //     assert token.allowance(this, spender) == value;
        //}
    }
}
