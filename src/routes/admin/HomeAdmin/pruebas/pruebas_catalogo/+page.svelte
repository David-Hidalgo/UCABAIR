<script lang="ts">
	//import navigate from 'svelte-spa-router';
	//import { createEventDispatcher } from 'svelte';
	import { enhance } from '$app/forms';
	import { goto } from '$app/navigation';

	import type { PageData } from './$types';
	import type { Tipo_prueba } from './+page.server.ts';
	// const dispatch = createEventDispatcher();

	let { data }: { data: PageData } = $props();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}

	// Define una interfaz para el tipo de datos que contiene 'datos'

	let tipo_pruebas: Tipo_prueba[] = new Array();
	for (let index = 0; index < data.tptable.length; index++) {
		let tipo_prueba: Tipo_prueba = {
			codigo_tp: undefined,
			nombre_tp: '',
			descripcion_tp: '',
			duracion_estimada_tp: ''
		};
		tipo_prueba.codigo_tp = data.tptable[index].codigo_tp;
		tipo_prueba.nombre_tp = data.tptable[index].nombre_tp;
		tipo_prueba.descripcion_tp = data.tptable[index].descripcion_tp;
		tipo_prueba.duracion_estimada_tp = data.tptable[index].duracion_estimada_tp;
		tipo_pruebas.push(tipo_prueba);
	}

	async function generarReporte(tipo_pruebas: Tipo_prueba[]) {
		//logica para
	}

	// Función para editar un registro
	async function editarRegistro(tipo_pruebas: Tipo_prueba) {
		/*try {
			const res = await fetch(`/aeronave/${tipo_pruebas.id_tipo_prueba}`, {//configurar la ruta
				method: 'PUT',
				body: JSON.stringify(tipo_pruebas),
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
		}
	}
	) {
		try {
			const res = await fetch(`/mineral/${aeronaves.id_avi}`, {//configurar la ruta
				method: 'PUT',
				body: JSON.stringify(aeronaves),
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
	async function eliminarRegistro(tipo_pruebas: Tipo_prueba) {
		await fetch(`/admin/HomeAdmin/pruebas/pruebas_catalogo`, {
			method: 'DELETE',

			body: JSON.stringify(tipo_pruebas.codigo_tp)
		});
		location.reload();
	}
</script>

<h2>Catalogo de Pruebas</h2>
<table>
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Descripción</th>
			<th>Duración</th>
		</tr>
	</thead>
	<tbody>
		{#each tipo_pruebas as dato}
			<tr>
				<td>{dato.nombre_tp}</td>
				<td>{dato.descripcion_tp}</td>
				<td>{dato.duracion_estimada_tp}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/prueba/{dato.codigo_tp}">
							<button onclick={() => editarRegistro(dato)}>
								<span>✏️</span>
								<!-- Icono de lápiz -->
							</button>
						</a>
						<button onclick={() => eliminarRegistro(dato)}>
							<span>🗑️</span>
							<!-- Icono de papelera -->
						</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/prueba">
	<button>Registrar Prueba</button>
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
