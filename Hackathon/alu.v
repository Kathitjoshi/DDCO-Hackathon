module ALU (
    input [7:0] A,
    input [7:0] B,
    input [1:0] opcode,
    output [7:0] result
);

    wire [7:0] and_result;
    wire [7:0] or_result;
    wire [7:0] nand_result;
    wire [7:0] nor_result;

    assign and_result = A & B;
    assign or_result = A | B;
    assign nand_result = ~(A & B);
    assign nor_result = ~(A | B);

    assign result = (opcode == 2'b00) ? and_result :
                    (opcode == 2'b01) ? or_result :
                    (opcode == 2'b10) ? nand_result :
                    (opcode == 2'b11) ? nor_result : 8'b00000000;

endmodule
