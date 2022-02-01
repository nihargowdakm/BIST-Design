`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2022 11:49:19
// Design Name: 
// Module Name: LFSR
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

module ML_lfsr(data_out, complete, reset, clock);
input reset;
input clock;
output [0:2] data_out;
output reg  complete; 
reg [0:2] lfsr_reg;		
reg [2:0] counter; 

always@(posedge clock or posedge reset)
begin
   if(reset == 1)
begin
lfsr_reg <= 9'b001;   
counter <= 3'b000;  
end
   else
begin
    lfsr_reg[0] <= lfsr_reg[2];
    lfsr_reg[1] <= lfsr_reg[0] ^ lfsr_reg[2];
    lfsr_reg[2] <= lfsr_reg[1];
counter = counter + 1;
if(counter <= 3'b110) 
     complete = 0;
else
     complete = 1; 
end
   end
assign data_out = lfsr_reg;  
endmodule
