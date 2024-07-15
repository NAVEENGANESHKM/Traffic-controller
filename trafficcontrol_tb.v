`timescale 1ns / 1ps

module trafficcontrol_tb;
reg clk, rst;
wire [2:0] T1;
wire [2:0] T2;
wire [2:0] S1;
wire [2:0] S2;

    // Assuming the module to be tested is named trafficcontrol
trafficcontrol dut(
        .clk(clk),
        .rst(rst),
        .T1(T1),
        .T2(T2),
        .S1(S1),
        .S2(S2)
    );

initial
begin
    clk=1'b0;
    forever #(100000/2) clk=~clk;
end
//    initial
//    $stop;//to add ps
initial
begin
    rst=0;
    #100000;
    rst=1;
    #100000;
    rst=0;
    #(100000*20);
    $finish;
    end

endmodule
