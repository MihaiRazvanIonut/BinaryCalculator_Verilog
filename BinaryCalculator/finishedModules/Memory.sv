module Memory #(parameter WIDTH = 8, parameter DinLenght = 32) (

    input                           Reset,
    input                           Clk,
    input      [DinLenght - 1 : 0]  Din,
    input      [WIDTH - 1 : 0]      Addr,
    input                           R_W,
    input                           Valid,
    output reg [DinLenght - 1 : 0]  Dout      

);

    integer DoutPos;
    reg [DinLenght-1 : 0] MemBank [WIDTH-1 : 0];

    always @(posedge Clk, negedge Reset) begin
        
        if (~Reset) begin

            for (DoutPos = 0; DoutPos < WIDTH; DoutPos = DoutPos + 1) begin

                MemBank[DoutPos] <= 0;

            end

            Dout <= 0;

        end else begin

            case (Valid)

                1'b0: begin
                    // Nu pot sa accesez memoria
                end

                1'b1: begin

                    case (R_W)

                        1'b0: begin  // Read

                            Dout <= MemBank[Addr];

                        end

                        1'b1: begin  // Write

                            MemBank[Addr] <= Din; 

                        end

                    endcase

                end

            endcase

        end

    end


endmodule