<script>
	// Supongamos que tienes un arreglo de objetos llamado `aviones`
	let aviones = [
		{ id: 1, nombre: 'Sky Cruiser', modelo: 'Boeing 737', capacidad: 180 },
		{ id: 2, nombre: 'Cloud Chaser', modelo: 'Airbus A320', capacidad: 160 },
		{ id: 3, nombre: 'Wind Rider', modelo: 'Embraer 190', capacidad: 100 },
		{ id: 4, nombre: 'Dreamliner', modelo: 'Boeing 787', capacidad: 250 },
		{ id: 5, nombre: 'Sky Giant', modelo: 'Airbus A380', capacidad: 500 }
		];

		let modeloSel = '';

		function filtrarPorModelo() {
			return aviones.filter(avion => avion.modelo.toLowerCase().includes(modeloSel.toLowerCase()));
		}	
</script>

<div>
	<label for="model">Filtrar por modelo:</label>
	<input type="text" id="model" bind:value={modeloSel} placeholder="Ingresa el modelo">
</div>

{#each filtrarPorModelo() as avion}
	<div class="avion-box">
		<h2>{avion.nombre}</h2>
		<p>Modelo: {avion.modelo}</p>
		<p>Capacidad: {avion.capacidad}</p>
		<a href='/cliente/productos/vistaProducto/{avion.id}'>
			<button>Solicitar Presupuesto</button>
		</a>
	</div>
{/each}

	<style>

		button{
			background-color: black;
			color: white;
			padding: 8px 16px;
			border: none;
			border-radius: 4px; 
			cursor: pointer;
		}

		.avion-box {
			border: 1px solid #ccc;
			padding: 16px;
			margin: 8px;
			border-radius: 8px;
			display: inline-block;
			width: calc(33.33% - 16px);
			box-sizing: border-box;
			vertical-align: top;
		}
	</style>