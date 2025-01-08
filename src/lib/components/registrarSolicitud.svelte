<script lang="ts">
	import type { Tipo_materia_prima, Compra } from '$lib/server/db/schema';
	export let datos_solicitud: Compra[];

	import { goto } from '$app/navigation';
	datos_solicitud = [
		{
			codigo_compra_com: undefined,
			numero_factura_com: undefined,
			fecha_hora_com: new Date(),
			monto_total_com: 0,
			impuesto_total_com: 0
		}
	];

	// Función para manejar el envío del formulario
	async function registrarSolicitud() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/rol`, {
			method: 'POST',
			body: JSON.stringify(solicitud),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();

		goto('/admin/HomeAdmin/solicitudes');
	}
</script>

<form on:submit|preventDefault={registrarSolicitud}>
	<div class="presupuesto">
		<h1>Solicitud de compra</h1>

		<h2>Informacion del material</h2>
		<p>Nombre:</p>
		<p>Descripcion:</p>
		<p>Unidad de medida:</p>

		<h2>Datos del proveedor</h2>
		<p>Nombre:</p>
		<p>RIF:</p>
		<p>Dirección:</p>
		<p>Correo:</p>
		<p>Teléfono:</p>

		<h1>Datos del solicitante</h1>
		<p>Nombre: UCABAIR</p>
		<p>RIF:J-0000007</p>
		<p>Dirección:Estado La Guaira,Catia La Mar, Avenida Balneario'</p>
		<p>Correo:ucabair@est.ucab.edu.ve</p>
		<p>Teléfono:0212-1459807</p>

		<h2>ID Factura:</h2>
	</div>
	<button type="submit">Registrar Solicitud</button>
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
