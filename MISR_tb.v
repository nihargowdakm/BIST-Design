`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2022 19:14:16
// Design Name: 
// Module Name: MISR_tb
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

module MISR_4bit_tb;
reg clock,reset;
wire [3:0] dataOut;
reg [1:0] dataIn;
MISR_4bit dut(.dataIn(dataIn),.reset(reset),.clock(clock),.dataOut(dataOut));
initial
begin
clock = 1'b0;  
end
always
#5 clock = ~clock;
initial
begin
reset = 1'b1;
#10 reset = 1'b0;
dataIn = 2'b10;
#10 dataIn = 2'b01;
#10 dataIn = 2'b01;
#10 dataIn = 2'b11;
#10 dataIn = 2'b01;
#10 dataIn = 2'b10;
#10 dataIn = 2'b10;
#20 $finish;
end
endmodule
