module Add4 (				//module and name 

  input [3:0] Data1, Data2,		// I. Port Declarations 

  input Cin, 

  output Cout, 

  output wire [3:0] Sum ); 

 

  assign {Cout, Sum} = Data1 + Data2 + Cin; 

   

endmodule
