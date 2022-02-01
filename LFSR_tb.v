`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2022 13:20:21
// Design Name: 
// Module Name: LFSR_tb
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

module tb_ML_lfsr;
reg clock,reset;  
wire [0:2] dt_out;
wire [0:2] counter;
ML_lfsr lfsr1(dt_out, complete, reset, clock);
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
end
always #100 $finish;
endmodule
