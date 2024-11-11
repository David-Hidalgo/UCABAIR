<script lang="ts">
	// Interfaz para representar un dato
	const fecha = new Date();
	export let id_editar: number;
	console.log(id_editar);

	interface Etapa {
		id_etapa_organizacion: String;
		id_proyecto_organizacion: String;
		et_or_descripcion: String;
		et_costo_estimado: String;
		et_or_duracion: String;
	}

	let etapa: Etapa = {
		id_etapa_organizacion: '',
		id_proyecto_organizacion: '',
		et_or_descripcion: '',
		et_costo_estimado: '',
		et_or_duracion: ''
	};
	// Función para manejar el envío del formulario
	async function registrarDato() {
		const res = await fetch(`http://localhost:4000/etapa`, {
			method: 'POST',
			body: JSON.stringify(etapa),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		console.log(data);
		alert('Se agregó exitosamente la etapa');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<h2>Configuracion Etapa</h2>

	<div class="datos_etapa">
		<label for="NumeroEtapa">Numero de Etapa</label>
		<input id="NumeroEtapa" bind:value={etapa.id_etapa_organizacion} />

		<label for="NumeroProyecto">Id del Proyecto</label>
		<input id="NumeroProyecto" bind:value={etapa.id_proyecto_organizacion} />

		<label for="Descripcion">Descripcion</label>
		<input id="Descripcion" bind:value={etapa.et_or_descripcion} />

		<label for="CostoEstimado">Costo estimado</label>
		<input id="CostoEstimado" bind:value={etapa.et_costo_estimado} />

		<label for="Duracion">Duracion</label>
		<input id="Duracion" bind:value={etapa.et_or_duracion} />
	</div>
	<button type="submit">Registrar configuracion Etapa</button>
</form>

<style>
	/* Estilos generales para el formulario */
	.datos_etapa {
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
