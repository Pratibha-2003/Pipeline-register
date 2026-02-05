module pipeline_reg #(
    parameter int DATA_WIDTH = 32
) (
    input  logic                  clk,
    input  logic                  rst_n,

    // Input interface
    input  logic [DATA_WIDTH-1:0] in_data,
    input  logic                  in_valid,
    output logic                  in_ready,

    // Output interface
    output logic [DATA_WIDTH-1:0] out_data,
    output logic                  out_valid,
    input  logic                  out_ready
);

    // Internal storage
    logic [DATA_WIDTH-1:0] data_reg;
    logic                 valid_reg;

    // Ready when register is empty or consumer is ready
    assign in_ready  = ~valid_reg || out_ready;
    assign out_valid = valid_reg;
    assign out_data  = data_reg;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_reg <= 1'b0;
        end else begin
            if (in_ready) begin
                valid_reg <= in_valid;
                if (in_valid) begin
                    data_reg <= in_data;
                end
            end
        end
    end

endmodule
