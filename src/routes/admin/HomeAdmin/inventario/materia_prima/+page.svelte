<script lang="ts">
    	// import navigate from 'svelte-spa-router';
	// import { createEventDispatcher } from 'svelte';
	import { enhance } from '$app/forms';
	import { goto } from '$app/navigation';
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
	import type { Tipo_materia_prima, Sede } from './+page.server.ts';
    // const dispatch = createEventDispatcher();

	let { data }: { data: PageData } = $props();

    import Combobox from "$lib/components/combobox.svelte";

	let materias_prima: Tipo_materia_prima[] = new Array();
	for (let index = 0; index < data.tmp_table.length; index++) {
		let tipo_materia_prima: Tipo_materia_prima = {
			codigo_tmp: undefined,
	        nombre_tmp:'',
	        descripcion_tmp: '',
	        unidad_medida_tmp: ''
		};
		tipo_materia_prima.codigo_tmp = data.tmp_table[index].codigo_tmp;
		tipo_materia_prima.nombre_tmp = data.tmp_table[index].nombre_tmp;
		tipo_materia_prima.descripcion_tmp = data.tmp_table[index].descripcion_tmp;
        tipo_materia_prima.unidad_medida_tmp = data.tmp_table[index].unidad_medida_tmp;
		materias_prima.push(tipo_materia_prima);
	};

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
    };

    async function editarRegistro(materia_prima: Tipo_materia_prima) {

	}

	// Función para eliminar un registro

	async function eliminarRegistro(materia_prima: Tipo_materia_prima) {
		await fetch(`http://localhost:5173/admin/HomeAdmin/inventario/materia_prima`, {
			method: 'DELETE',

			body: JSON.stringify(materia_prima.codigo_tmp)
		});
		location.reload();
	}
   
let sede_a_mostrar: number = 0;
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
<h2>Inventario Materia Prima</h2>
    
<select bind:value={sede_a_mostrar} onchange={() => mostrarSede(sede_a_mostrar)}>
    {#each sedes as sede}
        <option value={sede.codigo_sed}>{sede.nombre_sed}</option>
    {/each}
</select>

<table>
	<thead>
		<tr>
			<th>Material</th>
			<th>Descripcion</th>
			<th>Unidad de medida</th>
		</tr>
	</thead>
	<tbody>
		{#each materias_prima as dato}
			<tr>

                <td>{dato.nombre_tmp}</td>
                <td>{dato.descripcion_tmp}</td>
                <td>{dato.unidad_medida_tmp}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/materia_prima/{dato.codigo_tmp}">
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
<a href="/admin/HomeAdmin/registrar/materia_prima">
	<button>Registrar Materia Prima</button>
</a>
<a href="/admin/HomeAdmin/reponerInventario">
	<button>Reponer Inventario Materia Prima</button>
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

    .ComboboxSedes {
        display: flex;
        flex-direction: row;
        align-items: left;
    }
</style>