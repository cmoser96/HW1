module demorgan
(
  input  A,          // Single bit inputs
  input  B,

  output nA,         // Inverted intermediate inputs
  output nB,

  output AorB,       // Intermediate outputs
  output AandB,

  output nAandB,     // Single bit output, ~(A*B)
  output nAornB,     // Single bit output, (~A)+(~B)
  output nAorB,      // Single bit output, ~(A+B)
  output nAandnB     // Single bit output, (~A)*(~B)
);

  wire nA;
  wire nB;

  not Ainv(nA, A);  	// Invert the inputs and output nA/nB
  not Binv(nB, B);

  and andgate(AandB, A, B); // Intermediate gates before being inverted
  or orgate(AorB, A, B);

  not AorBinv(nAandB, AandB);     // NOT gate produces nAandB from AandB
  or orgate(nAornB, nA, nB);      // OR gate produces nAornB from nA and nB
  not AorBinv(nAorB, AorB);       // NOT gate produces nAorB from AorB
  and andgate(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB

endmodule