`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:29:20 09/25/2016
// Design Name:   ALU
// Module Name:   G:/Git_WorkSpace/CA_fm_lab/Lab01/code/ALU_test.v
// Project Name:  Lab01
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg [31:0] r;
	reg [31:0] s;
	reg [2:0] aluc;

	// Outputs
	wire [31:0] aluo;
	wire zf;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.r(r), 
		.s(s), 
		.aluc(aluc), 
		.aluo(aluo), 
		.zf(zf)
	);

	 initial begin
		r = 32'h0000010e;
		s = 32'h000000f1;
			 #100
			 aluc = 3'b000;
			 #100;
			 aluc = 3'b001;
			 #100;
			 aluc = 3'b010;
			 #100;
			 aluc = 3'b110;
			 #100;
			 aluc = 3'b100;
			 #100
			 aluc = 3'b111;
			 #100; 
		r=32'h0000f000;
		s=32'h000f0010;
			 aluc = 3'b111;
			 #100;
			 aluc = 3'b110;
			 r = 32'h00001111;
			 s = 32'h00001111;
			 
	end
      
endmodule

