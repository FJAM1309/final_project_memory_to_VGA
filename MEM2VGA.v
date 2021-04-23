module MEM2VGA (
	input iClk,
	output hsync, // 800 px - 640 para video
	output vsync, //525 px - 480 para video
	output [3:0]R,
	output [3:0]G,
	output [3:0]B
);

wire Clk25MHz;
wire VEN;
wire [15:0]HCount;
wire [15:0]VCount;
wire [11:0]Colors;

//FD CLK_25_MHz(
//.iClk (iClk),
//.ofrec (Clk25MHz)
//);


hcounter Horizontal_Sync (
.iClk (iClk),
.oHCounter (HCount),
.oVCounterFlag (VEN)
);

vcounter Vertical_Sync (
.iClk (iClk),
.ENVCounter (VEN),
.VCounter (VCount)
);

mem Memory_Color (
.iClk (iClk),
.data_out (Colors)
);

color Color_Module (
.iClk (iClk),
.icolors (Colors),
.HCount (HCount),
.VCount (VCount),
.R (R),
.G (G),
.B (B),
.hsync (hsync),
.vsync (vsync)
);

endmodule 