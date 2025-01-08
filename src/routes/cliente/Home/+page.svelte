<script>
	import carrito from '$lib/images/carrito_icono.png';
</script>

<div class="cuadroPublicidades"></div>
<div class="cajaMascomprados">
	<div class="masCompradosHeader">
		<p>Mas comprados</p>
		<div class="verMas">
			<a href="/cliente/productos"> Ver Mas</a>
		</div>
	</div>
	<div class="objetosMascomprados">
		<div class="objetos"></div>
	</div>
</div>

<style>
	.cuadroPublicidades {
		display: flex;
		border-radius: 10px;
		color: black;
		margin-top: 5px;
		border: solid black;
	}

	.cuadroPublicidad1 {
		border: solid black 1px;
		color: black;
		width: 50%;
		justify-content: center;
		align-items: center;
		border-radius: 5px;
		border-right: 3px solid black;
	}

	.cuadroPublicidad2 {
		display: table-column;
		justify-content: flex-end;
		width: 50%;
	}

	.publicidad2 {
		color: black;
		height: 200px;
		align-content: center;
		border-radius: 5px;
		border-bottom: 3px solid black;
	}

	.publicidad3 {
		color: black;
		height: 100px;
	}

	.masComprados {
		border: solid black;
		border-radius: 5px;
		margin-top: 10px;
	}

	.objetos {
		display: flex;
		justify-content: space-between;
		height: 220px;
	}

	.objeto {
		width: 18%;
		margin: 5px 5px;
	}

	.imagenProducto {
		justify-items: center;
		align-items: center;
		height: 65%;
		border-radius: 5px;
		border: solid gray;
	}

	.imagenProducto img {
		justify-content: center;
		width: 90%;
		height: 90%;
	}

	.descripcionProducto {
		border: thick black;
	}

	.verMas {
		justify-content: center;
		align-items: center;
		margin: 14px;
	}

	.masCompradosHeader {
		display: flex;
		justify-content: space-between;
	}

	.cajaMascomprados {
		display: block;
		margin: 10px 0 0 0;
	}
</style>
