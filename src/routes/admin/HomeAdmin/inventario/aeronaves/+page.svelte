<script lang="ts">
	// import navigate from 'svelte-spa-router';
	// import { createEventDispatcher } from 'svelte';
	import { enhance } from '$app/forms';
	import { goto } from '$app/navigation';
	import type { ActionData, PageData } from './$types';
	import type {
		Modelo_avion,
		Caracteristica,
		Caracteristica_modelo,
		Configuracion_avion,
		Tipo_pieza,
		Tipo_prueba,
		Configuracion_prueba_avion
	} from './+page.server.ts';
	import { writable } from 'svelte/store';
	// const dispatch = createEventDispatcher();

	let { data }: { data: PageData } = $props();
	let searchTerm = '';

	let pruebas: Tipo_prueba[] = new Array();
	for (let index = 0; index < data.tp_table.length; index++) {
		let prueba: Tipo_prueba = {
			codigo_tp: 0,
			nombre_tp: '',
			descripcion_tp: '',
			duracion_estimada_tp: ''
		};
		prueba.codigo_tp = data.tp_table[index].codigo_tp;
		prueba.nombre_tp = data.tp_table[index].nombre_tp;
		prueba.descripcion_tp = data.tp_table[index].descripcion_tp;
		prueba.duracion_estimada_tp = data.tp_table[index].duracion_estimada_tp;
		pruebas.push(prueba);
	}

	let configuraciones_p: Configuracion_prueba_avion[] = new Array();
	for (let index = 0; index < data.cpa_table.length; index++) {
		let configuracion: Configuracion_prueba_avion = {
			fk_tipo_prueba: 0,
			fk_modelo_avion: 0,
			fk_sede: 0
		};
		configuracion.fk_tipo_prueba = data.cpa_table[index].fk_tipo_prueba;
		configuracion.fk_modelo_avion = data.cpa_table[index].fk_modelo_avion;
		configuracion.fk_sede = data.cpa_table[index].fk_sede;
		configuraciones_p.push(configuracion);
	}

	let piezas: Tipo_pieza[] = new Array();
	for (let index = 0; index < data.p_table.length; index++) {
		let pieza: Tipo_pieza = {
			codigo_tp: 0,
			nombre_tp: '',
			descripcion_tp: '',
			precio_unidad_tp: 0,
			fk_tipo_pieza: 0
		};
		pieza.codigo_tp = data.p_table[index].codigo_tp;
		pieza.nombre_tp = data.p_table[index].nombre_tp;
		pieza.descripcion_tp = data.p_table[index].descripcion_tp;
		pieza.precio_unidad_tp = data.p_table[index].precio_unidad_tp;
		pieza.fk_tipo_pieza = data.p_table[index].fk_tipo_pieza;
		piezas.push(pieza);
	}

	let configuraciones_a: Configuracion_avion[] = new Array();
	for (let index = 0; index < data.ca_table.length; index++) {
		let configuracion: Configuracion_avion = {
			cantidad_pieza_ca: 0,
			fk_tipo_pieza: 0,
			fk_modelo_avion: 0,
			fk_sede: 0
		};
		configuracion.cantidad_pieza_ca = data.ca_table[index].cantidad_pieza_ca;
		configuracion.fk_tipo_pieza = data.ca_table[index].fk_tipo_pieza;
		configuracion.fk_modelo_avion = data.ca_table[index].fk_modelo_avion;
		configuracion.fk_sede = data.ca_table[index].fk_sede;
		configuraciones_a.push(configuracion);
	}

	let modelos_avion: Modelo_avion[] = new Array();
	for (let index = 0; index < data.ma_table.length; index++) {
		let modelo_avion: Modelo_avion = {
			codigo_ma: 0,
			nombre_ma: '',
			descripcion_ma: '',
			precio_unidad_ma: 0,
			fk_modelo_avion: 0
		};
		modelo_avion.codigo_ma = data.ma_table[index].codigo_ma;
		modelo_avion.nombre_ma = data.ma_table[index].nombre_ma;
		modelo_avion.descripcion_ma = data.ma_table[index].descripcion_ma;
		modelo_avion.precio_unidad_ma = data.ma_table[index].precio_unidad_ma;
		modelo_avion.fk_modelo_avion = data.ma_table[index].fk_modelo_avion;
		modelos_avion.push(modelo_avion);
	}

	let caracteristicas: Caracteristica[] = new Array();
	for (let index = 0; index < data.car_table.length; index++) {
		let caracteristica: Caracteristica = {
			codigo_car: 0,
			nombre_car: ''
		};
		caracteristica.codigo_car = data.car_table[index].codigo_car;
		caracteristica.nombre_car = data.car_table[index].nombre_car;
		caracteristicas.push(caracteristica);
	}

	let caracteristicas_modelo: Caracteristica_modelo[] = new Array();
	for (let index = 0; index < data.cm_table.length; index++) {
		let caracteristica_modelo: Caracteristica_modelo = {
			valor_cm: 0,
			unidad_medida_cm: '',
			fk_caracteristica: 0,
			fk_modelo_avion: 0
		};
		caracteristica_modelo.valor_cm = data.cm_table[index].valor_cm;
		caracteristica_modelo.unidad_medida_cm = data.cm_table[index].unidad_medida_cm;
		caracteristica_modelo.fk_caracteristica = data.cm_table[index].fk_caracteristica;
		caracteristica_modelo.fk_modelo_avion = data.cm_table[index].fk_modelo_avion;
		caracteristicas_modelo.push(caracteristica_modelo);
	}

	let caracteristicasPorAvion = modelos_avion.map((modelo) => {
		return {
			modelo,
			caracteristicas: caracteristicas_modelo
				.filter((cm) => cm.fk_modelo_avion === modelo.codigo_ma)
				.map((cm) => {
					return {
						...cm,
						caracteristica: caracteristicas.find((car) => car.codigo_car === cm.fk_caracteristica)
					};
				})
		};
	});

	// Función para editar un registro
	async function editarRegistro(modelo_avion: Modelo_avion) {
		/*try {
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

	async function eliminarRegistro(modelo_avion: Modelo_avion) {
		await fetch(`/admin/HomeAdmin/inventario/aeronaves`, {
			method: 'DELETE',
			body: JSON.stringify(modelo_avion.codigo_ma)
		});
		location.reload();
	}
</script>

<h2>Aeronaves</h2>
<table>
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Descripcion</th>
			<th>Precio Unidad</th>
			<th>Especificaciones</th>
			<th>Piezas</th>
			<th>Pruebas</th>
		</tr>
	</thead>
	<tbody>
		{#each modelos_avion as modelo_avion}
			<tr>
				<td>{modelo_avion.nombre_ma}</td>
				<td>{modelo_avion.descripcion_ma}</td>
				<td>{modelo_avion.precio_unidad_ma}</td>
				<td>
					<table>
						<tbody>
							{#each caracteristicasPorAvion.find((cpa) => cpa.modelo.codigo_ma === modelo_avion.codigo_ma)?.caracteristicas ?? [] as caracteristica}
								<tr>
									<td style="margin: 0; padding: 0; text-align: left;"
										><strong
											>{caracteristica.caracteristica
												? caracteristica.caracteristica.nombre_car.charAt(0).toUpperCase() +
													caracteristica.caracteristica.nombre_car.slice(1)
												: 'N/A'} :</strong
										>
										{caracteristica.valor_cm}
										{caracteristica.unidad_medida_cm}
									</td>
								</tr>
							{/each}
						</tbody>
					</table>
				</td>
				<td>
					<table>
						<tbody>
							{#each configuraciones_a.filter((c) => c.fk_modelo_avion === modelo_avion.codigo_ma) ?? [] as configuracion}
								<tr>
									<td style="margin: 0; padding: 0; text-align: left;"
										><strong
											>{piezas.find((p) => p.codigo_tp === configuracion.fk_tipo_pieza)?.nombre_tp} :</strong
										>
										{configuracion.cantidad_pieza_ca}
									</td>
								</tr>
							{/each}
						</tbody>
					</table>
				</td>
				<td>
					<table>
						<tbody>
							{#each configuraciones_p.filter((c) => c.fk_modelo_avion === modelo_avion.codigo_ma) ?? [] as configuracion}
								<tr>
									<td style="margin: 0; padding: 0; text-align: left;"
										><strong
											>{pruebas.find((p) => p.codigo_tp === configuracion.fk_tipo_prueba)
												?.nombre_tp}
										</strong>
									</td>
								</tr>
							{/each}
						</tbody>
					</table>
				</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/aeronave/{modelo_avion.codigo_ma}">
							<button onclick={() => editarRegistro(modelo_avion)}>
								<span>✏️</span>
							</button>
						</a>
						<button onclick={() => eliminarRegistro(modelo_avion)}>
							<span>🗑️</span>
						</button>
						<a href="/admin/HomeAdmin/inventario/aeronaves/configuracion/{modelo_avion.codigo_ma}">
							<button onclick={() => editarRegistro(modelo_avion)}>
								<span>Ver la Configuracion</span>
							</button>
						</a>
						<a href="/admin/HomeAdmin/registrar/planes/?cod_ma={modelo_avion.codigo_ma}">
							<button>Crear nueva Configuracion Avion</button>
						</a>
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
		padding: 0px;
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
