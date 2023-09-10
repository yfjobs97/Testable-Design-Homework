/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : O-2018.06-SP1
// Date      : Tue Nov  2 04:09:15 2021
/////////////////////////////////////////////////////////////


module myAnd ( A, B, Z );
  input A, B;
  output Z;


  GTECH_AND2 C7 ( .A(A), .B(B), .Z(Z) );
endmodule


module myOr ( A, B, Z );
  input A, B;
  output Z;


  GTECH_OR2 C7 ( .A(A), .B(B), .Z(Z) );
endmodule


module myInv ( A, Z );
  input A;
  output Z;


  GTECH_NOT U1 ( .A(A), .Z(Z) );
endmodule


module myNor ( A, B, Z );
  input A, B;
  output Z;


  GTECH_NOR2 U1 ( .A(B), .B(A), .Z(Z) );
endmodule


module F813_1 ( x1, x2, x3, x4, x5, z );
  input x1, x2, x3, x4, x5;
  output z;
  wire   c1, c2, x1_bar, c4, c3;

  myAnd u1 ( .A(x1), .B(x2), .Z(c1) );
  myOr u2 ( .A(x3), .B(x4), .Z(c2) );
  myInv invt ( .A(x1), .Z(x1_bar) );
  myAnd u3 ( .A(x1_bar), .B(x5), .Z(c4) );
  myNor u4 ( .A(c1), .B(c2), .Z(c3) );
  myOr u5 ( .A(c3), .B(c4), .Z(z) );
endmodule

