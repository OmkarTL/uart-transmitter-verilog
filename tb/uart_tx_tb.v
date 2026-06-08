module uart_tx_tb;

reg clk;
reg rst;
reg tx_start;
reg [7:0] tx_data;

wire baud_tick;
wire tx;
wire tx_done;

baud_generator #(
    .CLK_FREQ(100),
    .BAUD_RATE(10)
)
bg (
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick)
);

uart_tx uut (
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .tx_done(tx_done)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    tx_start = 0;
    tx_data = 8'h00;

    #20;
    rst = 0;

    #20;
    tx_data = 8'hA5;
    tx_start = 1;

    #10;
    tx_start = 0;

    #3000;

    $finish;
end

endmodule