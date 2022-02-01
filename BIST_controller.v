`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2022 15:40:06
// Design Name: 
// Module Name: BIST_controller
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


module controller_new(clock,reset,w,x,y,data_out,dataIn ,dataOut,testmode, fault_detected);

input clock,reset,testmode;
input  w,x,y;              // a,b and cin 
output [2:0] data_out;     // lfsr output
output [1:0] dataIn;       // Misr input
output [3:0] dataOut;      // Misr output
output reg fault_detected;
wire  a,b,cin;
wire finish;
parameter golden_signature = 4'b0011;
assign {a,b,cin} = (testmode == 1)? (data_out[2:0]) : ({w,x,y});

ML_lfsr I1(data_out, finish, reset, clock);
full_adder I2(a,b,cin,dataIn);    //dataIn is {sum,cout} of full adder
MISR_4bit I3(dataIn, reset, clock,dataOut);

always @(posedge clock)
begin
	if(testmode == 0)	//when bist mode is not on, faults can't be detected
	fault_detected = 0;
else
begin
	if(finish == 1)
	begin
		if(golden_signature == dataOut) 
		fault_detected = 0;
		else
		fault_detected = 1;
end
end
end

endmodule



