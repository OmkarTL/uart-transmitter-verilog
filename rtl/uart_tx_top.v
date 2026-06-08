module uart_tx_top(
    input  wire clk,
    input  wire btnC,

    output wire tx
);

wire baud_tick;
wire tx_done;

baud_generator baud_gen (
    .clk(clk),
    .rst(btnC),
    .baud_tick(baud_tick)
);

uart_tx uart_inst (
    .clk(clk),
    .rst(btnC),
    .baud_tick(baud_tick),
    .tx_start(1'b1),
    .tx_data(8'hA5),
    .tx(tx),
    .tx_done(tx_done)
);

endmodule