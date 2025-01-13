<script lang="ts">
	// import navigate from 'svelte-spa-router';
	// import { createEventDispatcher } from 'svelte';
	import { enhance } from '$app/forms';
	import { goto } from '$app/navigation';
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
	import type { Tipo_materia_prima, Lote_materia_prima, Compra, Historial_estatus_compra, Estatus } from './+page.server.ts';
	// const dispatch = createEventDispatcher();
	let { data }: { data: PageData } = $props();


	let estatuses: Estatus[] = new Array();
	for (let i = 0; i < data.est_table.length; i++) {
		let estatus: Estatus = {
			codigo_est: 0,
			nombre_est: '',
		};
		estatus.codigo_est = data.est_table[i].codigo_est;
		estatus.nombre_est = data.est_table[i].nombre_est;
		estatuses.push(estatus);
	}

	let historiales_estatus_compra: Historial_estatus_compra[] = new Array();
	for (let i = 0; i < data.hec_table.length; i++) {
		let historial_estatus_compra: Historial_estatus_compra = {
			fk_compra: 0,
			fk_estatus: 0,
			fecha_hec: new Date()
		};
		historial_estatus_compra.fk_compra = data.hec_table[i].fk_compra;
		historial_estatus_compra.fk_estatus = data.hec_table[i].fk_estatus;
		historial_estatus_compra.fecha_hec = data.hec_table[i].fecha_hec;
		historiales_estatus_compra.push(historial_estatus_compra);
	}

	let compras: Compra[] = new Array();
	for (let i = 0; i < data.comtable.length; i++) {
		let compra: Compra = {
			codigo_compra_com: 0,
			numero_factura_com: 0,
			fecha_hora_com: new Date(),
			monto_total_com: 0,
			impuesto_total_com: 0
		};
		compra.codigo_compra_com = data.comtable[i].codigo_compra_com;
		compra.numero_factura_com = data.comtable[i].numero_factura_com;
		compra.fecha_hora_com = data.comtable[i].fecha_hora_com;
		compra.monto_total_com = data.comtable[i].monto_total_com;
		compra.impuesto_total_com = data.comtable[i].impuesto_total_com;
		compras.push(compra);
	}

	let lotes_materia_prima: Lote_materia_prima[] = new Array();
	for (let i = 0; i < data.lmp.length; i++) {
		let lote_materia_prima: Lote_materia_prima = {
			codigo_lmp: 0,
			fk_configuracion_pieza: 0,
			fk_configuracion_pieza2: 0,
			fk_compra: 0,
			fk_almacen: 0,
			fk_almacen2: 0,
			cantidad_lmp: 0
		};
		lote_materia_prima.codigo_lmp = data.lmp[i].codigo_lmp;
		lote_materia_prima.fk_configuracion_pieza = data.lmp[i].fk_configuracion_pieza;
		lote_materia_prima.fk_configuracion_pieza2 = data.lmp[i].fk_configuracion_pieza2;
		lote_materia_prima.fk_compra = data.lmp[i].fk_compra;
		lote_materia_prima.fk_almacen = data.lmp[i].fk_almacen;
		lote_materia_prima.fk_almacen2 = data.lmp[i].fk_almacen2;
		lote_materia_prima.cantidad_lmp = data.lmp[i].cantidad_lmp;
		lotes_materia_prima.push(lote_materia_prima);
	}

	let tipo_materias_prima: Tipo_materia_prima[] = new Array();
	for (let i = 0; i < data.tmp.length; i++) {
		let tipo_materia_prima: Tipo_materia_prima = {
			codigo_tmp: 0,
			nombre_tmp: '',
			descripcion_tmp: '',
			unidad_medida_tmp: ''
		};

		tipo_materia_prima.codigo_tmp = data.tmp[i].codigo_tmp;
		tipo_materia_prima.nombre_tmp = data.tmp[i].nombre_tmp;
		tipo_materia_prima.descripcion_tmp = data.tmp[i].descripcion_tmp;
		tipo_materia_prima.unidad_medida_tmp = data.tmp[i].unidad_medida_tmp;
		tipo_materias_prima.push(tipo_materia_prima);
	}

	async function actualizarEstatus(fk_compra: number | undefined) {
		console.log(fk_compra);
		const res = await fetch(`/admin/HomeAdmin/solicitudes`, {
			method: 'PUT',
			body: JSON.stringify(fk_compra),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		location.reload();
		
	}

	//mostrarDatos();
	//
	// Función para editar un registro
	async function editarRegistro(compra: Compra) {
		/*try {
			const res = await fetch(`/mineral/${roles.id}`, {
				method: 'PUT',
				body: JSON.stringify(roles),
				headers: { 'Content-Type': 'application/json' }
			});

			if (res.ok) {
				// Si la solicitud fue exitosa, redirige al usuario
			} else {
				console.error('Error al actualizar el mineral:', res.status);
				// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
			}
		} catch (error) {
			console.error('Error en la solicitud:', error);
			// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
		}*/
	}

	// Función para eliminar un registro

	async function eliminarRegistro(compra: Compra) {
		/*await fetch(`/admin/HomeAdmin/roles`, {
			method: 'DELETE',

			body: JSON.stringify(compra.codigo_compra_com)
		});*/
	}
</script>

<h2>Solicitudes</h2>
<table>
	<thead>
		<tr>
			<th>Factura</th>
			<th>Material</th>
			<th>Fecha</th>
			<th>Precio</th>
			<th>Estatus</th>
		</tr>
	</thead>
	<tbody>
		{#each compras as compra}
			<tr>
				<td>{compra.numero_factura_com}</td>
				<td>{#each lotes_materia_prima as lote}
						{#if lote.fk_compra == compra.codigo_compra_com}
							{#each tipo_materias_prima as tmp}
								{#if lote.fk_configuracion_pieza == tmp.codigo_tmp}
									{tmp.nombre_tmp}
								{/if}
							{/each}
						{/if}
					{/each}
				</td>
				<td>{compra.fecha_hora_com}</td>
				<td>{compra.monto_total_com}</td>
				<td>
						{#each historiales_estatus_compra as hec}
							{#if hec.fk_compra == compra.codigo_compra_com}
								{#each estatuses as est}
									{#if hec.fk_estatus == est.codigo_est}
										<option>{est.nombre_est}</option>
										{#if est.codigo_est==11}
											<button onclick={() => actualizarEstatus(hec.fk_compra)}>Pagar</button>
										{/if}
									{/if}
								{/each}
							{/if}
						{/each}
			</tr>
		{/each}
	</tbody>
</table>

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
