<script lang="ts">
	import { goto } from '$app/navigation';
	// Interfaz para representar un dato
	const fecha = new Date();

	interface Maquinaria {
		tipo_maquinaria: string;
		cantidad_maquinaria: string;
	}

	let maquinaria: Maquinaria = {
		tipo_maquinaria: '',
		cantidad_maquinaria: ''
	};

	// Función para manejar el envío del formulario
	function registrarDato() {
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando dato:', maquinaria);
		goto(
			'/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa/configurarActividad/asignarMaquinaria'
		);
		alert('Se agregó exitosamente la maquinaria');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<div class="agregarMaquinaria">
		<label for="tipo_maquinaria">Tipo de maquinaria</label>
		<select id="tipo_maquinaria" bind:value={maquinaria.tipo_maquinaria}>
			<option value="Tractor">Tractor</option>
			<option value="Perforadora">Perforadora</option>
		</select>

		<label for="cantidad_maquinaria">Cantidad</label>
		<input id="cantidad_maquinaria" bind:value={maquinaria.cantidad_maquinaria} />
	</div>
	<button type="submit">Asignar maquinaria</button>
</form>

<style>
	/* Estilos generales para el formulario */
	.agregarMaquinaria {
		display: flex;
		flex-direction: row;
	}

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
