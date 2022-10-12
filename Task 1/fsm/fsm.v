// SB : Task 1 B : Finite State Machine
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design a Finite State Machine.

Recommended Quartus Version : 19.1
The submitted project file must be 19.1 compatible as the evaluation will be done on Quartus Prime Lite 19.1.

Warning: The error due to compatibility will not be entertained.
			Do not make any changes to Test_Bench_Vector.txt file. Violating will result into Disqualification.
-------------------
*/

//Finite State Machine design
//Inputs  : I (4 bit) and CLK (clock)
//Output  : Y (Y = 1 when 102210 sequence(decimal number sequence) is detected)

//////////////////DO NOT MAKE ANY CHANGES IN MODULE//////////////////
module fsm(
	input CLK,			  //Clock
	input [3:0]I,       //INPUT I
	output	  Y		  //OUTPUT Y
);

reg Y1 = 0;
assign Y = Y1;



////////////////////////WRITE YOUR CODE FROM HERE//////////////////// 
	

// Tip : Write your code such that Quartus Generates a State Machine 
//			(Tools > Netlist Viewers > State Machine Viewer).
// 		For doing so, you will have to properly declare State Variables of the
//       State Machine and also perform State Assignments correctly.
//			Use Verilog case statement to design.

localparam [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;
reg [2:0] TEMP = S0;
reg FS;
always @ (posedge CLK) begin

	case (TEMP)
	
		S0 : begin
		
			if(I == 1)
				TEMP = S1;
			else
				TEMP = S0;
				
			FS = 0;
		
		end
		
		S1 : begin
		
			if(I == 0)
				TEMP = S2;
			else if(I == 1)
				TEMP = S1;
			else
				TEMP = S0;
				
			FS = 0;
		
		end
		
		S2 : begin
		
			if(I == 2)
				TEMP = S3;
			else if(I == 1)
				TEMP = S1;
			else
				TEMP = S0;
				
			FS = 0;
		
		end
		
		S3 : begin
		
			if(I == 2)
				TEMP = S4;
			else if(I == 1)
				TEMP = S1;
			else
				TEMP = S0;
				
			FS = 0;
		
		end
		
		S4 : begin
		
			if(I == 1)
				TEMP = S5;
			else
				TEMP = S0;
				
			FS = 0;
		
		end
		
		S5 : begin
		
			if(I == 0) begin
				TEMP = S2;
				FS = 1;
			end
			else if(I == 1)
				TEMP = S1;
			else
				TEMP = S0;
		
		end
	endcase
	Y1 = FS;
end
	

////////////////////////YOUR CODE ENDS HERE//////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////