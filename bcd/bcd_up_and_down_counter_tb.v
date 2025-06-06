`timescale 1ns / 1ps
module testbranch;
wire [3:0] c;
reg clk, r, u_d;

bcd b1(.count(c), .clk(clk), .reset(r), .up_down(u_d));

always #5 clk = ~clk;

initial begin
   clk = 0;
   r = 1;
   u_d = 1;
   #10;
   r = 0;
   #100;
   u_d = 0;
   #100;
   r = 1;
   #10;
   r = 0;
   $finish;
end

initial begin
   $display("Time\tclk\trst\tup_down\tcount");
   $monitor("%g\t%b\t%b\t%b\t%b", $time, clk, r, u_d, c);
end
initial begin
    $dumpfile("bcd_counter.vcd");    // VCD file name
    $dumpvars(0, testbranch);        // 'testbranch' is your testbench module name
end
endmodule

