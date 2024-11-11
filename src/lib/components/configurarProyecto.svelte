<script lang="ts">
	import { goto } from '$app/navigation';
	import { page } from '$app/stores';
	export let id_editar: number;
	// Interfaz para representar un dato
	interface Proyecto {
		id_proyecto_organizacion: string;
		pr_or_duracion: String;
		pr_or_costo_estimado: String;
		pr_or_descripcion: String;
		id_mineral: String;
		rif_empresa: String;
	}

	let proyecto: Proyecto = {
		id_proyecto_organizacion: '',
		pr_or_duracion: '',
		pr_or_costo_estimado: '',
		pr_or_descripcion: '',
		id_mineral: '',
		rif_empresa: ''
	};

	// Función para manejar el envío del formulario
	async function registrarDato() {
		const res = await fetch(`http://localhost:4000/proyecto`, {
			method: 'POST',
			body: JSON.stringify(proyecto),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		console.log(data);
		alert('Se agregó exitosamente el proyecto');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<h2>Registrar Proyecto</h2>

	<label for="NumeroOrganizacionProyecto">Numero Organizacion de Proyecto</label>
	<input id="NumeroOrganizacionProyecto" bind:value={proyecto.id_proyecto_organizacion} />

	<label for="DuracionProyecto">Duracion del Proyecto</label>
	<input id="DuracionProyecto" bind:value={proyecto.pr_or_duracion} />

	<label for="CostoEstiminado">Costo Estiminado</label>
	<input id="CostoEstiminado" bind:value={proyecto.pr_or_costo_estimado} />

	<label for="DescripcionProyecto">Descripcion del Proyecto</label>
	<input id="DescripcionProyecto" bind:value={proyecto.pr_or_descripcion} />

	<label for="Mineral">Mineral a extraer</label>
	<input id="Mineral" bind:value={proyecto.id_mineral} />

	<label for="Empresa">Empresa que pide el proyecto</label>
	<input id="Empresa" bind:value={proyecto.rif_empresa} />

	<button type="submit">Registrar Proyecto</button>
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
