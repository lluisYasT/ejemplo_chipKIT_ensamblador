#!/usr/bin perl
# Si el programa se ha copiado desde el sketchbook de MPIDE
# con su correspondiente extensión ".pde" (nombre completo: sketch.pde), con este script se
# puede añadir las declaraciones de las funciones e incluir
# WProgram.h de la forma similar a como lo haría MPIDE
# 
# El resultado se guarda en el archivo sketch.cpp que es el que se
# compila normalmente. Si este archivo ya existe y no está vacio, no
# se hace nada hasta que el usuario lo borre.
use v5.18;

my $sketch_pde = 'src/sketch.pde';
my $sketch_cpp = 'src/sketch.cpp';
open(SKETCH, '<', $sketch_pde) or die 'No se ha encontrado el archivo';
if (-s $sketch_cpp) {
	die "El archivo $sketch_cpp ya existe y no está vacio"
}
open(my $nuevo, '>', $sketch_cpp);


my $text = "#include <WProgram.h>\n";

while (my $linea = <SKETCH>) {
	if($linea =~ m/(^(\w+ )+.*?\(.*?\))[^;]\s?\{?$/) {
		$text .= $1;
		$text .= ";\n";
	}
}
seek SKETCH, 0, 0;
my $linea_vieja;
while (my $linea = <SKETCH>) {
	if ($linea_vieja =~ m/^#include/ & $linea =~ m/^[^#]/) {
		print $nuevo $text;
	}
	print $nuevo $linea;
	$linea_vieja = $linea;
}

close(SKETCH);
close($nuevo);
