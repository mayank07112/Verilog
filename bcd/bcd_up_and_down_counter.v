module bcd(up_down, clk, reset, count);
    input up_down;
    input clk, reset;
    output reg [3:0] count;

    always @(posedge clk) begin
        if (reset) begin
            count <= 4'b0000;
        end else if (up_down) begin
            if (count == 4'b1001)
                count <= 4'b0000;
            else
                count <= count + 1;
        end else begin
            if (count == 4'b0000)
                count <= 4'b1001;
            else
                count <= count - 1;
        end
    end
endmodule
