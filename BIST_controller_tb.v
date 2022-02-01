`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2022 16:23:19
// Design Name: 
// Module Name: BIST_controller_tb
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

module tb_controller_new;

	// Inputs
	reg clock;
	reg reset;
	reg w,x,y;
	reg testmode;

	// Outputs
	wire [2:0] data_out;
	wire [1:0] dataIn;
	wire [3:0] dataOut;

	
	controller_new uut (
		clock,reset,w,x,y,data_out,dataIn ,dataOut,testmode, fault_detected
	);

	initial begin
		clock = 0;
		reset = 1;
		w = 1; x=1; y=1;
		testmode = 0;
	
	end
      
		always #5 clock = !clock;
		
		initial begin
		#10 reset =1'b0;
		testmode =1'b1;
		end
		always #120 $finish;
endmodule