/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Mon Nov  1 17:03:11 2021
/////////////////////////////////////////////////////////////


module myNand_0 ( A, B, Z );
  input A, B;
  output Z;


  GTECH_NAND2 U1 ( .A(B), .B(A), .Z(Z) );
endmodule


module myInv ( A, Z );
  input A;
  output Z;


  GTECH_NOT U1 ( .A(A), .Z(Z) );
endmodule


module myNor_0 ( A, B, Z );
  input A, B;
  output Z;


  GTECH_NOR2 U1 ( .A(B), .B(A), .Z(Z) );
endmodule


module myNand_1 ( A, B, Z );
  input A, B;
  output Z;


  GTECH_NAND2 U1 ( .A(B), .B(A), .Z(Z) );
endmodule


module myNand_2 ( A, B, Z );
  input A, B;
  output Z;


  GTECH_NAND2 U1 ( .A(B), .B(A), .Z(Z) );
endmodule


module myNor_1 ( A, B, Z );
  input A, B;
  output Z;


  GTECH_NOR2 U1 ( .A(B), .B(A), .Z(Z) );
endmodule


module myNor_2 ( A, B, Z );
  input A, B;
  output Z;


  GTECH_NOR2 U1 ( .A(B), .B(A), .Z(Z) );
endmodule


module F820 ( x1, x2, x3, x4, x5, z );
  input x1, x2, x3, x4, x5;
  output z;
  wire   c1, c2, c3, c4, c5, c6;

  myNand_0 u1 ( .A(x2), .B(x3), .Z(c1) );
  myNand_2 u2 ( .A(x3), .B(x4), .Z(c2) );
  myNand_1 u3 ( .A(c1), .B(c2), .Z(c3) );
  myInv invt ( .A(c3), .Z(c4) );
  myNor_0 u4 ( .A(x1), .B(c3), .Z(c5) );
  myNor_2 u5 ( .A(c4), .B(x5), .Z(c6) );
  myNor_1 u6 ( .A(c5), .B(c6), .Z(z) );
endmodule

