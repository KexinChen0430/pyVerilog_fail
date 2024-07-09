module test_warmboot (input wire btn1, btn2, output reg [7:0] data);
top wb (
    .boot(btn2),
    .s1(image[1]),
    .s0(image[0])
  );
// Registro del valor de la imagen a cargar.
reg [1:0] image = 2'b00;
//   para mostrar la pulsación y elegimos la siguiente imagen.
always @(posedge(btn1)) begin
    data[7] = ~data[7];
    image = image + 1;
end
// Se muestra la imagen a cargar tras el warn boot (al pulsar el botón 2).
assign data[6:0] = {5'b00000, image[1], image[0]};
endmodule