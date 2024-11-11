<script lang="ts">
	import { goto } from '$app/navigation';
	// Interfaz para representar un dato
	interface Maquinaria {
		tipo_maquinaria: string;
		nombre: string;
		placa_identificacion: string;
		marca: string;
		modelo: string;
		estado: string[];
		fecha_adquisicion: Date;
		ubicacion: string;
		valor: string;
		comentario: string;
	}

	export let maquinaria: Maquinaria = {
		tipo_maquinaria: '',
		nombre: '',
		placa_identificacion: 'GAV-35X',
		marca: '',
		modelo: '',
		estado: ['Activa', 'Fuera de Servicio', 'En Mantenimiento'],
		fecha_adquisicion: new Date(),
		ubicacion: '',
		valor: '',
		comentario: ''
	};

	// Función para manejar el envío del formulario
	function registrarDato() {
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando dato:', maquinaria);
		goto('/admin/HomeAdmin/maquinaria');
		alert('Se agregó exitosamente la maquinaria');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<h2>Registrar Maquinaria</h2>

	<label for="maquinaria">Maquinaria</label>
	<input id="maquinaria" bind:value={maquinaria.tipo_maquinaria} />

	<label for="nombre">Nombre</label>
	<input id="nombre" bind:value={maquinaria.nombre} />

	<label for="placa_identificacion">Placa</label>
	<input id="placa_identificacion" bind:value={maquinaria.placa_identificacion} />

	<label for="marca">Marca</label>
	<input id="marca" bind:value={maquinaria.marca} />

	<label for="modelo">Modelo</label>
	<input id="modelo" bind:value={maquinaria.modelo} />

	<label for="estado">Estado</label>
	<input id="estado" bind:value={maquinaria.estado} />

	<label for="fecha_adquisicion">Fecha Adquisicion</label>
	<input id="fecha_adquisicion" bind:value={maquinaria.fecha_adquisicion} />

	<label for="ubicacion">Ubicacion</label>
	<input id="ubicacion" bind:value={maquinaria.ubicacion} />

	<label for="valor"> Valor</label>
	<input id="valor" bind:value={maquinaria.valor} />

	<label for="comentario">Comentario</label>
	<input id="comentario" bind:value={maquinaria.comentario} />

	<button type="submit">Registrar Maquinaria</button>
</form>

<style>
	/* Estilos generales para el formulario */
	form {
		max-width: 100%;
		margin: 0 auto;
		padding: 20px;
		border: 1px solid #ccc;
		border-radius: 5px;
		background-color: #f9f9f9;
		display: flex;
		flex-direction: column;
	}

	/* Estilos para las etiquetas y campos de entrada */
	label {
		display: block;
		margin-bottom: 10px;
		font-weight: bold;
	}

	input {
		width: 40%;
		padding: 10px;
		margin-bottom: 15px;
		border: 1px solid #ccc;
		border-radius: 3px;
		font-size: 14px;
	}

	/* Estilos para el botón de envío */
	button {
		background-color: #050505;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 16px;
	}
</style>
