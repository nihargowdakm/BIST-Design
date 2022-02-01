`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2022 14:57:28
// Design Name: 
// Module Name: CUT
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module full_adder(
    input a,
    input b,
    input cin,
    output[1:0] dataIn
    
    );
parameter f_1 = 1'b0;  // a stuck at 0
parameter f_2 = 1'b0;  // r stuck at 0
parameter f_3 = 1'b1;  // sum stuck at 1

wire p,q,r,a11,r1,sum1,sum,cout;
and f1(a11,~f_1,a);
xor x1(p,a11,b);
and a1(r,a11,b);
xor x2(sum1,p,cin);
or f3(sum,sum1,f_3);
and a2(q,p,cin);
and f2(r1,r,~f_2);
or o1(cout,q,r1);
assign dataIn = {sum,cout};
endmodule
