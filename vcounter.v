module vcounter (
	input iClk,
	input ENVCounter,
	output [15:0]VCounter
);

reg [15:0]VCounter_D = 16'd0;
reg [15:0]VCounter_Q = 16'd0;

assign VCounter = VCounter_Q;

always @ (posedge iClk)
begin
	VCounter_Q <= VCounter_D;
end

always @ *
begin
	if(ENVCounter) // si la bandera de vsync está encendida
	begin
		if(VCounter_Q < 15'd1080) // y si no llegó al límite de pixeles
		begin
			VCounter_D = VCounter_Q + 15'd1; // contador de vsync
		end
		else
		begin
			VCounter_D = 15'd0; 
		end
	end
end

endmodule 