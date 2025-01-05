<script lang="ts">
	import { goto } from '$app/navigation';
	import type {Tipo_materia_prima} from '$lib/server/db/schema'
	export let id_editar: Tipo_materia_prima | undefined;
	// Interfaz para representar un dato
	let materia_prima: Tipo_materia_prima;
	let codigo_viejo: number;
	if (id_editar!=undefined) {
		materia_prima = id_editar;
		if (id_editar.codigo_tmp)
		codigo_viejo=id_editar.codigo_tmp
	} else {
		materia_prima = {
			codigo_tmp: undefined,
			nombre_tmp: '',
			descripcion_tmp: '',
			unidad_medida_tmp: ''
		};
	}

	async function decide() {
		
		if (id_editar==undefined) {
			registrarMateriaPrima();
		} else {
			actualizarMateriaPrima();
		}
	}

	async function actualizarMateriaPrima() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/editar/materia_prima`, {
			method: 'PUT',
			body: JSON.stringify({materia_prima:materia_prima , codigo_viejo:codigo_viejo}),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		alert('Rol modificado con exito');
		goto('/admin/HomeAdmin/inventario/materia_prima');
	}

	// Función para manejar el envío del formulario
	async function registrarMateriaPrima() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/materia_prima`, {
			method: 'POST',
			body: JSON.stringify(materia_prima),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();


		alert('Rol agregado con exito');
		goto('/admin/HomeAdmin/inventario/materia_prima');
	}
</script>

<form on:submit|preventDefault={decide}>
	<h2>Registrar Materia Prima</h2>

	<label for="codigo_tmp">Código</label>
	<input id="codigo_tmp" bind:value={materia_prima.codigo_tmp} />

	<label for="nombre_tmp">Nombre</label>
	<input id="nombre_tmp" bind:value={materia_prima.nombre_tmp} />

	<label for="descripcion_tmp">Descripción</label>
	<input id="descripcion_tmp" bind:value={materia_prima.descripcion_tmp} />

	<label for="unidad_medida_tmp">Unidad de Medida</label>
	<input id="unidad_medida_tmp" bind:value={materia_prima.unidad_medida_tmp} />

	<button type="submit">Registrar Materia Prima</button>
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
