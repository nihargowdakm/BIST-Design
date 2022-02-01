`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2022 15:13:02
// Design Name: 
// Module Name: CUT_tb
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


module CUT_tb;
reg a,b,cin;
wire [1:0] dataIn;

full_adder dut(a,b,cin,dataIn);

initial begin
a=1'b0;b=1'b0;cin=1'b0;
#10 a=1'b0;b=1'b0;cin=1'b1;
#10 a=1'b0;b=1'b1;cin=1'b0;
#10 a=1'b0;b=1'b1;cin=1'b1;
#10 a=1'b1;b=1'b0;cin=1'b0;
#10 a=1'b1;b=1'b0;cin=1'b1;
#10 a=1'b1;b=1'b1;cin=1'b0;
#10 a=1'b1;b=1'b1;cin=1'b1;
end

initial begin #80 $finish; end
endmodule
