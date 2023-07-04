
module Mux2x1 #(parameter WIDTH = 8)(

    input                   Sel,
    input      [WIDTH-1:0]  IN_A,
    input      [WIDTH-1:0]  IN_B,
    output reg [WIDTH-1:0]  Out

);
    always @(*) begin
    case (Sel)

        1'b0: begin

            Out <= IN_A;

        end

        1'b1: begin

            Out <= IN_B;

        end

        default: begin

            Out <= {8{1'bx}};

        end

    endcase
    end

endmodule
