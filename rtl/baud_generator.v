module baud_generator #(
    parameter CLK_FREQ  = 100_000_000, // Basys-3 Clock
    parameter BAUD_RATE = 9600
)(
    input  wire clk,
    input  wire rst,
    output reg  baud_tick
);

localparam BAUD_DIV = CLK_FREQ / BAUD_RATE;

reg [13:0] count;

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        count     <= 0;
        baud_tick <= 1'b0;
    end
    else
    begin
        if (count == BAUD_DIV - 1)
        begin
            count     <= 0;
            baud_tick <= 1'b1;
        end
        else
        begin
            count     <= count + 1'b1;
            baud_tick <= 1'b0;
        end
    end
end

endmodule