module demorgan
(
  input A,    // Single bit inputs
  input B,
  output nA,   // Output intermediate complemented inputs
  output nB,
  output AorB,    // Output intermediate and/or
  output AandB,
  output nAandnB,    // Single bit outputs, (~A)*(~B)
  output nAandB,   // ~(A*B)
  output nAornB,    // (~A + ~B)
  output nAorB   // ~(A + B)
);

  wire nA;    // Wires -> intermediate outputs
  wire nB;
  wire AandB;
  wire AorB;

  not Ainv(nA, A);    // Inverters -> take signal and produce complement of the signal
  not Binv(nB, B);
  not AandBinv(nAandB, AandB);
  not AorBinv(nAorB, AorB);

  and andgatenAnB(nAandnB, nA, nB);   // AND gates
  and andgateAB(AandB, A, B);

  or orgateAB(AorB, A, B);    // OR gates
  or orgatenAnB(nAornB, nA, nB);

endmodule
