`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2020 03:01:54 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
//
//    ALU OTTER_ALU(
//        .op_1    (),
//        .op_2    (),
//        .alu_fun (),
//        .result  ()
//        );
//  
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU(
    input [31:0] op_1,
    input [31:0] op_2,
    input [3:0] alu_fun,
    output reg [31:0] result
    );
	
	typedef enum logic [0:3] {
	SLL	 =	1,
	XOR	 =	4,
	SRL	 =	5,
	OR	 =	6,
	AND	 =	7,
	LUI	 =	9,
	SLTU =	3,
	ADD	 =	0,
    SUB  =	8,
    SRA  =	13,	
    SLT  =	2
	}alu_op_code;
	
	alu_op_code ALU_OP;
	
	assign ALU_OP = alu_op_code'(alu_fun); //Cast the alu_fun input as enum type

	always @(alu_fun,result,op_1,op_2)
	begin
		case (ALU_OP) 
		XOR:	result = op_1 ^  op_2;	    //xor  - Bit-wise XOR compares each bit in op_1 to each corresponding bit in op_2.
		OR:     result = op_1 |  op_2;	    //or   - Bit-wise OR compares each bit in op_1 to each corresponding bit in op_2.
		AND:	result = op_1 &  op_2;	    //and  - Bit-wise AND compares each bit in op_1 to each corresponding bit in op_2.
		SLL:	result = op_1 << op_2[4:0];	//sll  - Shifts op_1 left by the number specified in op_2 (up to 5 LSB's). Inserts 0's.
		SRL:	result = op_1 >> op_2[4:0]; //srl  - Shifts op_1 right by the number specified in op_2 (up to 5 LSB's). Inserts 0's.
		LUI:	result = op_1;	            //lui  - 20 bits from op_1 is loaded into the upper 20 bits of result. Lower 12 bits are zeros.
		SLTU:	if ( op_1 < op_2)	 		//sltu - Result is 1 if op_1 < op_2. Else result is 0. Performes unsigned comparison.
				begin
					result = 1;
				end
				else
				begin
					result = 0;
				end
		ADD:	result = $signed (op_1) +   $signed (op_2);	//add - Adds op_1 and op_2. Both are cast as signed values.
		SUB:	result = $signed (op_1) -   $signed (op_2);	//sub - Subtracts op_1 from op_2. Both are cast as signed values.
		SRA:	result = $signed (op_1) >>> op_2[4:0];  	//sra - Shifts op_1 right by the number specified in op_2 (up to 5 LSB's). Sign extends MSB.
        SLT:	if (	 $signed (op_1) < 	$signed (op_2))	//slt - Result is 1 if op_1 < op_2. Else result is 0. Performs signed comparison.
				begin
					result = 1;
				end
				else
				begin
					result = 0;
				end
        default	result = 0;
	   endcase 
    end
endmodule