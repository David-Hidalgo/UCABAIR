<script lang='ts'>
		import { enhance } from '$app/forms';
	import { goto } from '$app/navigation';
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
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
	// Supongamos que tienes un arreglo de objetos llamado `aviones`
	let aviones = [
		{ id: 1, nombre: 'Sky Cruiser', modelo: 'Boeing 737', capacidad: 180 },
		{ id: 2, nombre: 'Cloud Chaser', modelo: 'Airbus A320', capacidad: 160 },
		{ id: 3, nombre: 'Wind Rider', modelo: 'Embraer 190', capacidad: 100 },
		{ id: 4, nombre: 'Dreamliner', modelo: 'Boeing 787', capacidad: 250 },
		{ id: 5, nombre: 'Sky Giant', modelo: 'Airbus A380', capacidad: 500 }
	];

	let modeloSel = '';

	function filtrarPorModelo() {
		return modelos_avion.filter((avion) => avion.nombre_ma.toLowerCase().includes(modeloSel.toLowerCase()));
	}
</script>

<div>
	<label for="model">Filtrar por modelo:</label>
	<input type="text" id="model" bind:value={modeloSel} placeholder="Ingresa el modelo" />
</div>

{#each filtrarPorModelo() as avion}
	<div class="avion-box">
		<h2>{avion.nombre_ma}</h2>
		<p>Descripcion:{avion.descripcion_ma}</p>
		<p>Precio: {avion.precio_unidad_ma}</p>
		<a href="/cliente/productos/vistaProducto/{avion.codigo_ma}">
			<button>Solicitar Presupuesto</button>
		</a>
	</div>
{/each}

<style>
	button {
		background-color: black;
		color: white;
		padding: 8px 16px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}

	.avion-box {
		border: 1px solid #ccc;
		padding: 16px;
		margin: 8px;
		border-radius: 8px;
		display: inline-block;
		width: calc(33.33% - 16px);
		box-sizing: border-box;
		vertical-align: top;
	}
</style>
