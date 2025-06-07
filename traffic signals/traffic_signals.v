module traffic_signal(light, clk);
output reg [1:0]light;
input clk;
reg [0:1]state;
parameter RED = 2'b00, YELLOW = 2'b10, GREEN = 2'b01;
parameter S0=0, S1=1, S2=2;
always @(posedge clk)
begin
    case(state)
    S0: state<=S1;
    S1: state<=S2;
    S2: state<=S0;
    default: state<=S0;
    endcase

end
always @(state)
begin
    case(state)
    S0: light<=RED;
    S1: light<=GREEN;
    S2: light<=YELLOW;
    default: light<=RED;

    endcase
end
endmodule 