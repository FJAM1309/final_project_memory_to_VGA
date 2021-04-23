module mem(
	input iClk,
	output [11:0]data_out
);

reg [3:0]ROM [2:0];

reg [11:0]rData_D;
reg [11:0]rData_Q;

assign data_out = rData_Q;

initial
begin
  $readmemh("colors.mem.txt", ROM); // leer archivo y guardar en memoria
end

always @ (posedge iClk)
begin
	rData_Q <= rData_D;		
end

always @ *
begin
	rData_D[3:0] = ROM[0]; //primer dato de la memoria
	rData_D[7:4] = ROM[1]; //segundo dato de la memoria
	rData_D[11:8] = ROM[2]; //tercer dato de la memoria
end

endmodule 