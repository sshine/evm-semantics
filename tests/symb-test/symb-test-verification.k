requires "evm-symb-testing.k"
requires "../specs/erc20/verification.k"

module SYMB-TEST-VERIFICATION
  imports EVM-SYMB-TESTING
  imports VERIFICATION

  rule X in SetItem(X) => true [simplification]

endmodule
