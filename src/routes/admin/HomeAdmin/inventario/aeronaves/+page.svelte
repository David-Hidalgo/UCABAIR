<script lang="ts">
	// import navigate from 'svelte-spa-router';
	// import { createEventDispatcher } from 'svelte';
	import { enhance } from '$app/forms';
	import { goto } from '$app/navigation';
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
	import type { Modelo_avion } from './+page.server.ts';
	// const dispatch = createEventDispatcher();

	let { data }: { data: PageData } = $props();
	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}

	let modelos_avion: Modelo_avion[] = new Array();
	for (let index = 0; index < data.ma_table.length; index++) {
		let modelo_avion:  Modelo_avion = {
			codigo_ma: 0,
            nombre_ma: '',
            descripcion_ma: '',
            precio_unidad_ma: 0,
            fk_modelo_avion: undefined
		};
        modelo_avion.codigo_ma = data.ma_table[index].codigo_ma;
        modelo_avion.nombre_ma = data.ma_table[index].nombre_ma;
        modelo_avion.descripcion_ma = data.ma_table[index].descripcion_ma;
        modelo_avion.precio_unidad_ma = data.ma_table[index].precio_unidad_ma;
        modelo_avion.fk_modelo_avion = data.ma_table[index].fk_modelo_avion;
        modelos_avion.push(modelo_avion);
	};




	
	// Función para editar un registro
	async function editarRegistro(modelo_avion: Modelo_avion) {
		/*try {
			const res = await fetch(`http://localhost:4000/mineral/${aeronaves.id_avi}`, {//configurar la ruta
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

    async function eliminarRegistro(modelo_avion: Modelo_avion) {
		await fetch(`http://localhost:5173/admin/HomeAdmin/roles`, {
			method: 'DELETE',

			body: JSON.stringify(modelo_avion.codigo_ma)
		});
	}

</script>

<h2>Aeronaves</h2>
<table>
	<thead>
		<tr>
			<th>Id</th>
			<th>Nombre</th>
			<th>Descripcion</th>
			<th>Precio Unidad</th>
		</tr>
	</thead>
	<tbody>
		{#each modelos_avion as modelo_avion}
			<tr>
				<td>{modelo_avion.codigo_ma}</td>
                <td>{modelo_avion.nombre_ma}</td>
                <td>{modelo_avion.descripcion_ma}</td>
                <td>{modelo_avion.precio_unidad_ma}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/mineral">
							<button on:click={() => editarRegistro(modelo_avion)}>
								<span>✏️</span>
								<!-- Icono de lápiz -->
							</button>
						</a>
						<button on:click={() => eliminarRegistro(modelo_avion)}>
							<span>🗑️</span>
							<!-- Icono de papelera -->
						</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/aeronave">
	<button>Registrar Aeronave</button>
</a>
<a href="/admin/HomeAdmin/reponerInventario">
	<button>Iniciar Ensamblaje Aeronave</button>
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
