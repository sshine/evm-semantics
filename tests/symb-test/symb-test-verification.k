requires "evm-symb-testing.k"
requires "../specs/erc20/verification.k"

module SYMB-TEST-VERIFICATION
  imports EVM-SYMB-TESTING
  imports VERIFICATION

  //todo not sure if they have any effect or have to be in evm-symb-testing.md
  rule X in SetItem(A) => X ==K A                                                     [simplification]

  rule X in SetItem(A) SetItem(B) S:Set => X in SetItem(A) orBool X in (SetItem(B) S) [simplification]

  //when BUF1 and BUF2 partially overlap and cannot be sorted by sorting rule.
  rule MEM [ N := BUF1 ] [ M := BUF2:ByteArray ] [ N := BUF3 ] => MEM [ M := BUF2 ] [ N := BUF3 ]
    requires #sizeByteArray(BUF1) ==Int #sizeByteArray(BUF3)                          [simplification]

endmodule
