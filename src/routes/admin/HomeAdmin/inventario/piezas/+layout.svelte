<script lang="ts">
	import Combobox from "$lib/components/combobox.svelte";
	//import navigate from 'svelte-spa-router';
	//import { createEventDispatcher } from 'svelte';
	//import RegistrarPieza from '$lib/components/registrarPieza.svelte';

	//const dispatch = createEventDispatcher();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Pieza';
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Pieza {
		id_pieza: number;
		nombre_pie:string;
		tipo_pieza: string;
		precio_pieza: number;
		cantidad: number;
	}

	export let piezas: Pieza[] = [
		{
			id_pieza: 1,
			nombre_pie: 'Ala',
			tipo_pieza: 'Tipo T',
			precio_pieza: 100,
			cantidad: 100
		},
		{
			id_pieza: 2,
			nombre_pie: 'Tren de Aterrizaje',
			tipo_pieza: 'Grande',
			precio_pieza: 200,
			cantidad: 200
		},
		{
			id_pieza: 3,
			nombre_pie: 'Alerón',
			tipo_pieza: 'Curvo',
			precio_pieza: 300,
			cantidad: 300
		}
	];

	async function generarReporte(piezas: Pieza[]) {
		//logica para
	}

	/*ESTA COMENTADO POR QUE NO SE HA IMPLEMENTADO Y ARROJA ERROR CON LA BD
	async function mostrarDatos() {
		const response = await fetch('http://localhost:4000/piezas');
		const data: Pieza[] = await response.json();
		piezas = data;
	}

	mostrarDatos();
	//
	// Función para editar un registro
	async function editarRegistro(piezas: Pieza) {
		try {
			const res = await fetch(`http://localhost:4000/Pieza/${piezas.id_mineral}`, {
				method: 'PUT',
				body: JSON.stringify(piezas),
				headers: { 'Content-Type': 'application/json' }
			});

			if (res.ok) {
				// Si la solicitud fue exitosa, redirige al usuario
			} else {
				console.error('Error al actualizar el Pieza:', res.status);
				// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
			}
		} catch (error) {
			console.error('Error en la solicitud:', error);
			// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
		}
	}

	// Función para eliminar un registro
	async function eliminarRegistro(piezas: Pieza) {
		await fetch(`http://localhost:4000/Pieza/${piezas.id_pieza}`, {
			method: 'DELETE'
		});
	}*/
</script>

