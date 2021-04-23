module color(
	input iClk,
	input [11:0]icolors,
	input [15:0]HCount,
	input [15:0]VCount,
	output [3:0]R,
	output [3:0]G,
	output [3:0]B,
	output hsync,
	output vsync
);

reg [3:0]R_D = 4'd0; // px rojo
reg [3:0]R_Q = 4'd0;
 
reg [3:0]G_D = 4'd0; //px verde
reg [3:0]G_Q = 4'd0;

reg [3:0]B_D = 4'd0; //px azul
reg [3:0]B_Q = 4'd0;

reg hsync_D = 1'd0; //horizontal sync
reg hsync_Q = 1'd0;

reg vsync_D = 1'd0; //vertical sync
reg vsync_Q = 1'd0;


assign hsync = hsync_Q;
assign vsync = vsync_Q;

assign R = R_Q;
assign G = G_Q;
assign B = B_Q;

always @ (posedge iClk)
begin
	R_Q <= R_D;
	G_Q <= G_D;
	B_Q <= B_D;
	hsync_Q <= hsync_D;
	vsync_Q <= vsync_D;
end

always @ *
begin
	if(HCount < 784 && HCount > 143 && VCount < 515 && VCount > 34) // prendido si están en "addressable video time"
	begin
		R_D = icolors[3:0]; // primer dato - rojo
		G_D = icolors[7:4]; // segundo dato - verde
		B_D = icolors[11:8]; // tercer dato - azul
	end
	else
	begin // apagados si no están en "addressable video time"
		R_D = 4'h0;
		G_D = 4'h0;
		B_D = 4'h0;
	end
	
	if(HCount < 97)
	begin
		hsync_D = 1'd1;
	end
	else
	begin
		hsync_D = 1'd0;
	end
	
	if(VCount < 3)
	begin
		vsync_D = 1'd1;
	end
	else
	begin
		vsync_D = 1'd0;
	end
end 

endmodule 