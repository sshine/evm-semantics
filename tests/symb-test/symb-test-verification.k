requires "evm-symb-testing.k"
requires "../specs/erc20/verification.k"

module SYMB-TEST-VERIFICATION
  imports EVM-SYMB-TESTING
  imports VERIFICATION

  //todo not sure if they have any effect or have to be in evm-symb-testing.md
  rule X in SetItem(A) => X ==K A                                                     [simplification]

  rule X in SetItem(A) SetItem(B) S:Set => X in SetItem(A) orBool X in (SetItem(B) S) [simplification]

endmodule
