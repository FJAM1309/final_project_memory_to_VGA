module MEM2VGA_tb ();

reg iClk = 0;
wire hsync;
wire vsync;
wire [3:0]R;
wire [3:0]G;
wire [3:0]B;


MEM2VGA uut (
	.iClk (iClk),
	.hsync (hsync),
	.vsync (vsync),
	.R (R),
	.G (G),
	.B (B)
);

always 
begin
	#5;
	iClk = ~iClk;
end

endmodule 