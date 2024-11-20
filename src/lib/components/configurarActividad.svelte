<!-- Interfaz para representar un dato -->
<script lang="ts">
	export let id_editar: number;
	console.log(id_editar);
	// Interfaz para representar un dato
	const fecha = new Date();

	interface Actividad {
		id_actividad_organizacion: String;
		id_etapa_organizacion: String;
		id_proyecto_organizacion: String;
		ac_or_descripcion: String;
		ac_or_costo_estimado: String;
		ac_or_duracion: String;
	}

	let actividad: Actividad = {
		id_actividad_organizacion: '',
		id_etapa_organizacion: '',
		id_proyecto_organizacion: '',
		ac_or_descripcion: '',
		ac_or_costo_estimado: '',
		ac_or_duracion: ''
	};

	// Función para manejar el envío del formulario
	async function registrarDato() {
		const res = await fetch(`http://localhost:4000/actividad`, {
			method: 'POST',
			body: JSON.stringify(actividad),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		console.log(data);

		alert('Se registró la configuracion de la actividad');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<h2>Configurar Actividad</h2>
	<div class="actividad">
		<label for="nombre_actividad">ID Actividad Organizacion</label>
		<input id="nombre_actividad" bind:value={actividad.id_actividad_organizacion} />

		<label for="id_etapa_organizacion">ID Etapa Organizacion</label>
		<input id="id_etapa_organizacion" bind:value={actividad.id_etapa_organizacion} />

		<label for="id_proyecto_organizacion">ID Proyecto Organizacion</label>
		<input id="id_proyecto_organizacion" bind:value={actividad.id_proyecto_organizacion} />

		<label for="ac_or_descripcion">Descripcion</label>
		<input id="ac_or_descripcion" bind:value={actividad.ac_or_descripcion} />

		<label for="ac_or_costo_estimado">Costo Estimado Actividad</label>
		<input id="ac_or_costo_estimado" bind:value={actividad.ac_or_costo_estimado} />

		<label for="ac_or_duracion">Duracion</label>
		<input id="ac_or_duracion" bind:value={actividad.ac_or_duracion} />
	</div>
	<button type="submit">Registrar configuracion Actividad</button>
</form>

<style>
	/* Estilos generales para el formulario */
	.actividad {
		display: flex;
		flex-direction: column;
		flex-direction: column;
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
