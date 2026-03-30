`timescale 1ns/1ps

module sync_fifo #(
    parameter DEPTH = 64 ,    // FIFO深度 0~63
    parameter WIDTH = 8      // 数据位宽
)(
    // 时钟复位（单时钟，同步读写）
    input                       clk         ,
    input                       rst_n       ,
    // 写端口
    input                       wren        ,
    input  [WIDTH-1:0]          wdata       ,
    // 读端口
    input                       rden        ,
    output [WIDTH-1:0]          rdata       ,
   
    output                      full        ,
    output                      empty       
);

// ===================== 地址位宽计算 =====================
localparam ADDR_WIDTH = clogb2(DEPTH-1);  // 64深度 → 6位地址，7位指针

// ===================== 读写指针（二进制） =====================
reg [ADDR_WIDTH:0]   wr_ptr;  // 7位指针 (最高位判满)
reg [ADDR_WIDTH:0]   rd_ptr;  // 7位指针

// 读写地址（低6位）
wire [ADDR_WIDTH-1:0] wr_addr = wr_ptr[ADDR_WIDTH-1:0];
wire [ADDR_WIDTH-1:0] rd_addr = rd_ptr[ADDR_WIDTH-1:0];

// ===================== 写指针控制 =====================
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        wr_ptr <= 'd0;
    else if(wren && !full)  // 写使能+未满，指针+1
        wr_ptr <= wr_ptr + 1'b1;
end

// ===================== 读指针控制 =====================
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        rd_ptr <= 'd0;
    else if(rden && !empty) // 读使能+未空，指针+1
        rd_ptr <= rd_ptr + 1'b1;
end

// ===================== 空满标志判断（核心） =====================
assign empty = (wr_ptr == rd_ptr);                      // 指针相等 → 空
assign full  = ({~wr_ptr[ADDR_WIDTH], wr_ptr[ADDR_WIDTH-1:0]} == rd_ptr); // 最高位取反相等 → 满

// ===================== 同步RAM例化 =====================
sync_ram #(
    .DATA_WIDTH (WIDTH),
    .DATA_DEPTH (DEPTH)
) u_sync_ram (
    .clk    (clk        ),
    .rst_n  (rst_n      ),
    .wren   (wren & ~full),
    .waddr  (wr_addr    ),
    .wdata  (wdata      ),
    .rden   (rden & ~empty),
    .raddr  (rd_addr    ),
    .rdata  (rdata      )
);

// ===================== 位宽计算函数 =====================
function integer clogb2(input integer number);
begin
    for(clogb2=0; number>0; clogb2=clogb2+1)
        number = number >> 1;
end
endfunction

endmodule

// ===================== 同步RAM（单时钟） =====================
module sync_ram #(
    parameter DATA_WIDTH = 8,
    parameter DATA_DEPTH = 64
)(
    input                       clk     ,
    input                       rst_n   ,
    // 写端口
    input                       wren    ,
    input [clogb2(DATA_DEPTH-1)-1:0] waddr,
    input [DATA_WIDTH-1:0]      wdata   ,
    // 读端口
    input                       rden    ,
    input [clogb2(DATA_DEPTH-1)-1:0] raddr,
    output reg [DATA_WIDTH-1:0] rdata
);

reg [DATA_WIDTH-1:0] ram [0:DATA_DEPTH-1];
integer i;

// 写操作
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        for(i=0; i<DATA_DEPTH; i=i+1)
            ram[i] <= 'd0;
    end
    else if(wren)
        ram[waddr] <= wdata;
end

// 读操作
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        rdata <= 'd0;
    else if(rden)
        rdata <= ram[raddr];
end

function integer clogb2(input integer number);
begin
    for(clogb2=0; number>0; clogb2=clogb2+1)
        number = number >> 1;
end
endfunction

endmodule
