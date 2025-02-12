`timescale 1ns / 1ps  
module trafficcontrol(

  input clk,rst,
  output reg[2:0]T1,
  output reg[2:0]T2,
  output reg[2:0]S1,
  output reg[2:0]S2
  );
  parameter s1=0,s2=1,s3=2,s4=3;//STATES
  reg[3:0]count;
  reg[2:0] ps;
  parameter sec7=7,sec5=5,sec2=2,sec3=3; //SECONDS OF TRANSISTION

  always@(posedge clk or posedge rst)
        begin
	if (rst==1)
	begin
	ps<=s1;
	count<=0;
	end
	else
	   case(ps)
	         s1:if(count<sec7)
		     begin
		     ps<=s1;
		     count<=count+1;
		     end
	           else
		     begin
		     ps<=s2;
		     count<=0;
		     end
	           
		
                 s2:if(count<sec5)
		      begin
		      ps<=s2;
		      count<=count+1;
		      end
	            else
		      begin
		      ps<=s3;
		      count<=0;
		      end
	         s3:if(count<sec2)
		      begin
		      ps<=s3;
		      count<=count+1;
		      end
	            else
                      begin
		      ps<=s4;
		      count<=0;
		      end
                 s4:if(count<sec3)
		      begin
		      ps<=s4;
		      count<=count+1;
		      end
	           else
		      begin
		      ps<=s1;
		      count<=0;
		     end
		 default: ps<=s1; 
                 endcase
        end
  always@(ps)
    begin
      case(ps)
             s1:
	     begin
		  T1<=3'b001;//first digit=red,second digit=yellow,third digit=green
                  T2<=3'b001;
                  S1<=3'b100;
                  S2<=3'b010;
                  end
             s2:
	     begin
		  T1<=3'b001;
                  T2<=3'b100;
                  S1<=3'b010;
                  S2<=3'b001;
                  end
             s3:
	     begin
		  T1<=3'b100;
                  T2<=3'b001;
                  S1<=3'b001;
                  S2<=3'b010;
                  end
             s4:
	     begin
		  T1<=3'b010;
                  T2<=3'b100;
                  S1<=3'b001;
                  S2<=3'b001;
                  end
             default:
	     begin
                  T1<=3'b000;
                  T2<=3'b000;
                  S1<=3'b000;
                  S2<=3'b000;
                  end
             endcase
     end

endmodule


	







