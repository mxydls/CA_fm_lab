`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:13 09/25/2016 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
	input [31:0]r,//first operand
	input [31:0]s,//second operand
	input [2:0]aluc,//control code of the operation
	output [31:0]aluo,//result
	output zf//flag: zf = (op==sub)&&(r==s)
    );
	/*
	000 - and
	001 - or
	010 - add
	100 - nor
	110 - sub
	111 - set on less than
	*/
	parameter one = 32'h00000001, zero_0 = 32'h00000000;
	assign zf = (aluc==6)&&(r==s);
	wire [31:0] aluo_and, aluo_or, aluo_add, aluo_sub, aluo_nor, aluo_slt;
	reg [31:0]aluo;
	assign aluo_and = r&s;
	assign aluo_or = r|s;
	assign aluo_add = r+s;
	assign aluo_sub = r-s;
	assign aluo_nor = ~(r|s);
	assign aluo_slt = (r<s)? one : zero_0;
	always@(r or s or aluc)
		case(aluc)
			3'b000: aluo = aluo_and;
			3'b001: aluo = aluo_or;
			3'b010: aluo = aluo_add;
			3'b100: aluo = aluo_nor;
			3'b110: aluo = aluo_sub;
			3'b111: aluo = aluo_slt;
			default aluo = 32'hx;
		endcase
	
endmodule
