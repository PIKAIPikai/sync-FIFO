`timescale 1ns/1ps
`define CLK_PERIOD 20  // 时钟周期20ns (50MHz)

module tb_sync_fifo;

parameter  DATA_WIDTH = 8   ;
parameter  DATA_DEPTH = 64  ;

// ===================== 端口信号 =====================
reg                      clk         ;
reg                      rst_n       ;
reg                      wren        ;
reg  [DATA_WIDTH-1:0]    wdata       ;
reg                      rden        ;
wire [DATA_WIDTH-1:0]    rdata       ;
wire                     full        ;
wire                     empty       ;

// ===================== 时钟产生 =====================
initial begin
    clk = 0;
    forever #(`CLK_PERIOD/2) clk = ~clk;
end

// ===================== 复位产生 =====================
initial begin
    rst_n = 0;
    repeat(20) @(posedge clk);
    rst_n = 1;
end

// ===================== 同步FIFO例化 =====================
sync_fifo #(
    .DEPTH(DATA_DEPTH),
    .WIDTH(DATA_WIDTH)
)u_sync_fifo(
    .clk    (clk    ),
    .rst_n  (rst_n  ),
    .wren   (wren   ),
    .wdata  (wdata  ),
    .rden   (rden   ),
    .rdata  (rdata  ),
    .full   (full   ),
    .empty  (empty  )
);

// ===================== 写激励：写满64个数据 =====================
initial begin
    wren  = 0;
    wdata = 0;
    wait(rst_n == 1'b1);  // 等待复位释放
    repeat(10) @(posedge clk);
    
    // 连续写64次，直到FIFO满
    wren = 1;
    repeat(DATA_DEPTH) @(posedge clk) wdata <= wdata + 1'b1;
    wren = 0;
    
    repeat(20) @(posedge clk);
end

// ===================== 读激励：读空64个数据 =====================
initial begin
    rden = 0;
    wait(full == 1'b1);  // 等待写满后再读
    repeat(10) @(posedge clk);
    
    // 连续读64次，直到FIFO空
    rden = 1;
    repeat(DATA_DEPTH) @(posedge clk);
    rden = 0;
    
    repeat(20) @(posedge clk);
    $finish;
end

// ===================== 波形dump =====================
initial begin
    $fsdbDumpfile("sync_fifo.fsdb");
    $fsdbDumpvars(0, tb_sync_fifo);
end

endmodule
