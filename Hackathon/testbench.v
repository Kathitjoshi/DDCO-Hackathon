module testbench;
    reg [7:0] A, B;
    reg [1:0] opcode;
    wire [7:0] result;

    // Instantiate the ALU module
    ALU alu_instance (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result)
    );

    initial begin
        // Create the VCD file for GTKWave
        $dumpfile("waveform.vcd");
        $dumpvars(0, testbench);

        // Display header
        $display("Time\tA\tB\topcode\tresult");
        $monitor("%g\t%b\t%b\t%b\t%b", $time, A, B, opcode, result);

        // Test different cases
        A = 8'b11001100; B = 8'b10101010; opcode = 2'b00; #10; // AND
        A = 8'b11001100; B = 8'b10101010; opcode = 2'b01; #10; // OR
        A = 8'b11001100; B = 8'b10101010; opcode = 2'b10; #10; // NAND
        A = 8'b11001100; B = 8'b10101010; opcode = 2'b11; #10; // NOR

        // End simulation after all cases
        #10 $finish;
    end
endmodule