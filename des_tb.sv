`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2024 13:54:02
// Design Name: 
// Module Name: des_tb
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


module des_tb(

    );
    reg clk,reset,in;
    wire out;
    always #5 clk=~clk;
    des dut(.clk(clk),.reset(reset),.in(in),.out(out));
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("time=%t reset=%b in=%b out=%b",$time,reset,in,out);
    clk<=0;
    reset<=0;
    in<=1;
    #4 reset<=1;
    #10 in<=0;
    #10 reset<=0;
    #10 $finish;
    end
endmodule
