<script lang="ts">
	// import navigate from 'svelte-spa-router';
	// import { createEventDispatcher } from 'svelte';
	import { enhance } from '$app/forms';
	import { goto } from '$app/navigation';
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
	import type { Tipo_pieza, Sede } from './+page.server.ts';
	// const dispatch = createEventDispatcher();

	let { data }: { data: PageData } = $props();

	let piezas: Tipo_pieza[] = new Array();
	for (let index = 0; index < data.tp_table.length; index++) {
		let tipo_pieza: Tipo_pieza = {
			codigo_tp: undefined,
			nombre_tp: '',
			descripcion_tp: '',
			fk_tipo_pieza: 0,
			precio_unidad_tp: 0
		};
		tipo_pieza.codigo_tp = data.tp_table[index].codigo_tp;
		tipo_pieza.nombre_tp = data.tp_table[index].nombre_tp;
		tipo_pieza.descripcion_tp = data.tp_table[index].descripcion_tp;
		tipo_pieza.fk_tipo_pieza = data.tp_table[index].fk_tipo_pieza;
		tipo_pieza.precio_unidad_tp = data.tp_table[index].precio_unidad_tp;
		piezas.push(tipo_pieza);
	}

	let sedes: Sede[] = new Array();
	for (let index = 0; index < data.sedes_table.length; index++) {
		let sede: Sede = {
			codigo_sed: undefined,
			nombre_sed: '',
			direccion_sed: '',
			fk_lugar: undefined,
			central_sed: false
		};

		sede.codigo_sed = data.sedes_table[index].codigo_sed;
		sede.nombre_sed = data.sedes_table[index].nombre_sed;
		sede.direccion_sed = data.sedes_table[index].direccion_sed;
		sede.fk_lugar = data.sedes_table[index].fk_lugar;
		sede.central_sed = data.sedes_table[index].central_sed;
		sedes.push(sede);
	}

	async function editarRegistro(pieza: Tipo_pieza) {}

	// Función para eliminar un registro

	async function eliminarRegistro(pieza: Tipo_pieza) {
		await fetch(`http://localhost:5173/admin/HomeAdmin/inventario/piezas`, {
			method: 'DELETE',

			body: JSON.stringify(pieza.codigo_tp)
		});
		location.reload();
	}

	let sede_mostrar: string = '';

	function mostrarSede(cod_sed: number) {
		// Filtrar las materias primas por la sede seleccionada
		//let materias_prima_filtradas = data.tmp_table.filter(materia => materia.codigo_sed === codigo_sed);
		//materias_prima = materias_prima_filtradas.map(materia => ({
		//    codigo_tmp: materia.codigo_tmp,
		//    nombre_tmp: materia.nombre_tmp,
		//    descripcion_tmp: materia.descripcion_tmp,
		//    unidad_medida_tmp: materia.unidad_medida_tmp
		//}));
	}
</script>

<h2>Inventario Piezas</h2>
<select bind:value={sede_a_mostrar} onchange={() => mostrarSede(sede_a_mostrar)}>
	{#each sedes as sede}
		<option value={sede.codigo_sed}>{sede.nombre_sed}</option>
	{/each}
</select>
<table>
	<thead>
		<tr>
			<th>Pieza</th>
			<th>Tipo de Pieza</th>
			<th>Precio por unidad</th>
		</tr>
	</thead>
	<tbody>
		{#each piezas as dato}
			<tr>
				<td>{dato.nombre_tp}</td>
				<td>{dato.descripcion_tp}</td>
				<td>{dato.precio_unidad_tp}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/pieza/{dato.codigo_tp}">
							<button onclick={() => editarRegistro(dato)}>
								<span>✏️</span>
							</button>
						</a>
						<button onclick={() => eliminarRegistro(dato)}>
							<span>🗑️</span>
						</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/pieza">
	<button>Registrar Pieza</button>
</a>
<a href="/admin/HomeAdmin/reponerInventario">
	<button>Iniciar Ensamblaje Pieza</button>
</a>
<a href="/admin/HomeAdmin/reponerInventario">
	<button>Solicitar Pieza a Sede</button>
</a>

<style>
	.botonesUD {
		display: flex;
		background-color: white;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
	}
	table {
		width: 100%;
		border-collapse: collapse;
	}
	th,
	td {
		border: 1px solid #adadad;
		padding: 8px;
		text-align: left;
		font-family: 'Baskervville';
		font-style: light;
		align-items: center;
		text-align: center;
		letter-spacing: -0.03em;
	}
	thead {
		background-color: white;
	}

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
