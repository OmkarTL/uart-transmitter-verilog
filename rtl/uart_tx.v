module uart_tx(
    input  wire       clk,
    input  wire       rst,
    input  wire       baud_tick,
    input  wire       tx_start,
    input  wire [7:0] tx_data,

    output reg        tx,
    output reg        tx_done
);

localparam IDLE  = 2'b00;
localparam START = 2'b01;
localparam DATA  = 2'b10;
localparam STOP  = 2'b11;

reg [1:0] state;
reg [7:0] data_reg;
reg [2:0] bit_count;

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        state     <= IDLE;
        tx        <= 1'b1;
        tx_done   <= 1'b0;
        data_reg  <= 8'd0;
        bit_count <= 3'd0;
    end
    else
    begin
        tx_done <= 1'b0;

        case(state)

            IDLE:
            begin
                tx <= 1'b1;

                if(tx_start)
                begin
                    data_reg  <= tx_data;
                    bit_count <= 3'd0;
                    state     <= START;
                end
            end

            START:
            begin
                if(baud_tick)
                begin
                    tx    <= 1'b0;
                    state <= DATA;
                end
            end

            DATA:
            begin
                if(baud_tick)
                begin
                    tx <= data_reg[0];
                    data_reg <= data_reg >> 1;

                    if(bit_count == 3'd7)
                    begin
                        bit_count <= 3'd0;
                        state <= STOP;
                    end
                    else
                    begin
                        bit_count <= bit_count + 1'b1;
                    end
                end
            end

            STOP:
            begin
                if(baud_tick)
                begin
                    tx      <= 1'b1;
                    tx_done <= 1'b1;
                    state   <= IDLE;
                end
            end

            default:
            begin
                state <= IDLE;
            end

        endcase
    end
end

endmodule