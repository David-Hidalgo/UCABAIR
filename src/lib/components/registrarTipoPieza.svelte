<script lang="ts">
	import type { Tipo_pieza } from '$lib/server/db/schema';
	let piezas: Tipo_pieza[] = [];
	import { goto } from '$app/navigation';
	const { id_editar, piezas_fk } :{id_editar: Tipo_pieza | undefined;	piezas_fk: Tipo_pieza[];}= $props<{
		id_editar: Tipo_pieza | undefined;
		piezas_fk: Tipo_pieza[];
	}>();
	console.log(piezas_fk);

	let pieza_fk_selected: Tipo_pieza = $state(piezas_fk[0]);
	console.log(pieza_fk_selected);
	
	let pieza: Tipo_pieza = $state({
		codigo_tp: 0,
		nombre_tp: '',
		descripcion_tp: '',
		precio_unidad_tp: 0,
		fk_tipo_pieza: 0
	});
	let codigo_viejo: number;
	if (id_editar != undefined) {
		pieza.codigo_tp = id_editar.codigo_tp
		pieza.descripcion_tp = id_editar.descripcion_tp
		pieza.fk_tipo_pieza = id_editar.fk_tipo_pieza
		pieza.nombre_tp = id_editar.nombre_tp
		pieza.precio_unidad_tp = id_editar.precio_unidad_tp
		if (id_editar.codigo_tp) {codigo_viejo = id_editar.codigo_tp;}
	}

	async function decide() {
		if (id_editar == undefined) {
			registrarTipoPieza();
		} else {
			actualizarTipoPieza();
		}

		async function actualizarTipoPieza() {
			console.log(pieza);
			const res = await fetch(`/admin/HomeAdmin/editar/pieza`, {
				method: 'PUT',
				body: JSON.stringify({ pieza: pieza, codigo_viejo: codigo_viejo }), //Hay que enviar correos y telefonos tambien
				headers: { 'Content-Type': 'application/json' }
			});
			const data = await res.json();
			goto('/admin/HomeAdmin/inventario/piezas');
		}
	}
	async function registrarTipoPieza() {
		const res = await fetch(`/admin/HomeAdmin/registrar/pieza`, {
			method: 'POST',
			body: JSON.stringify(pieza),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		goto('/admin/HomeAdmin/inventario/piezas');
	}
</script>

<form onsubmit={decide}>
	<label for="codigo_pieza">Codigo Pieza</label>
	<input id="codigo_pieza" bind:value={pieza.codigo_tp} />

	<label for="pieza_field">Nombre Pieza </label>
	<input id="nombre_pieza" bind:value={pieza.nombre_tp} />

	<label for="descripcion_pieza">Descripcion Pieza</label>
	<input id="descripcion_pieza" bind:value={pieza.descripcion_tp} />

	<label for="piezas_fk">Si esta pieza se compone de alguna otra, seleccionela</label>
	<select
		id="piezas_fk"
		bind:value={pieza_fk_selected}
		onchange={() => {
			console.log(pieza_fk_selected.codigo_tp);						
		}}
	>
		{#each piezas_fk as pieza_fk}
			<option value={pieza_fk.codigo_tp}>{pieza_fk.nombre_tp}</option>
		{/each}
	</select>

	<label for="precio_pieza">Precio Pieza</label>
	<input id="precio_pieza}" bind:value={pieza.precio_unidad_tp} />
	<button type="submit">Registrar Pieza</button>
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
