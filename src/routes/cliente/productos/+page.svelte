<script lang="ts">
	import { enhance } from '$app/forms';
	import { goto } from '$app/navigation';
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
	import type { Modelo_avion } from './+page.server.ts';
	import { writable } from 'svelte/store';
	// const dispatch = createEventDispatcher();

	let { data }: { data: PageData } = $props();
	let searchTerm = writable('');

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

	// Supongamos que tienes un arreglo de objetos llamado `aviones`
	let modeloSel = '';

	function filtrarPorModelo() {
		if (!searchTerm) {
			return modelos_avion;
		}
		return modelos_avion.filter((avion) =>
			avion.nombre_ma.toLowerCase().includes($searchTerm.toLowerCase())
		);
	}
</script>

<input
	type="text"
	placeholder="Buscar por modelo"
	bind:value={$searchTerm}
	oninput={filtrarPorModelo}
/>

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
