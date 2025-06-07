module testbench;
reg clk;
wire [1:0]light;
traffic_signal t1(.light(light), .clk(clk));
always #5 clk=~clk;
initial 
begin
    clk=1'b0;
    $monitor($time, "light=%b", light);
    #100 $finish;
end
always@(light)
begin
if(light==00)
begin
    $display($time, "RED");
end
else if(light==01)
begin
    $display($time, "GREEN");
end
else
begin
    $display($time, "YELLOW");
end
end




endmodule