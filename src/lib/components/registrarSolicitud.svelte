<script lang="ts">
	import type { Tipo_materia_prima, Compra, Lote_materia_prima, Proveedor2 } from '$lib/server/db/schema';
	export let datos_solicitud: Lote_materia_prima[];
	export let materia_prima: Tipo_materia_prima[];
	export let proveedores: Proveedor2[];
	import { goto } from '$app/navigation';
	let provselected: Proveedor2;
	let proveedoresArray: { codigo_com: number | undefined, denominacion_comercial: string }[] = [];
	
	for (let i = 0; i < proveedores.length; i++) {
		let proveedor: {codigo_com :number| undefined, denominacion_comercial:string} = {
			codigo_com: proveedores[i].codigo_com,
			denominacion_comercial: proveedores[i].denominacion_comercial
		};
		proveedoresArray.push(proveedor);
	}
	let compra: Compra = {
		codigo_compra_com: 0,
		numero_factura_com: 0,
		fecha_hora_com: new Date(),
		monto_total_com: Math.floor(Math.random() * 10000)+5000,
		impuesto_total_com: Math.floor(Math.random() * 99)+1,
	};

	let lote_materia_prima: Lote_materia_prima = {
		codigo_lmp: undefined,
		fk_configuracion_pieza: materia_prima[0].codigo_tmp,
		fk_configuracion_pieza2: undefined,
		fk_compra: compra.codigo_compra_com,
		fk_almacen: undefined,
		fk_almacen2: undefined,
		cantidad_lmp: 0
	};


	// Función para manejar el envío del formulario
	async function registrarSolicitud() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/solicitud`, {
			method: 'POST',
			body: JSON.stringify(compra),
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
		<p>Nombre:{materia_prima[0].nombre_tmp}</p>
		<p>Descripcion:{materia_prima[0].descripcion_tmp}</p>
		<p>Unidad de medida:{materia_prima[0].unidad_medida_tmp}</p>

		<label for="proveedores">Proveedores que venden dicho material:</label>
			<select id="proveedores" bind:value={provselected} on:change={() => console.log(provselected)}
	>			{#each proveedoresArray as proveedor}
					<option value={proveedor.codigo_com}>{proveedor.denominacion_comercial}</option>
				{/each}
		</select>

		<h1>Datos del solicitante</h1>
		<p>Nombre: UCABAIR</p>
		<p>RIF:J-0000007</p>
		<p>Dirección:Venezuela, Estado La Guaira,Catia La Mar, Avenida Balneario</p>
		<p>Correo:ucabair@est.ucab.edu.ve</p>
		<p>Teléfono:0212-1459807</p>

		<h2>ID Factura:(Generado por sistema)</h2>
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

	select {
		background-color:white;
		color:black;
		border: none;
		border-radius: 3px;
		border: solid black 1px;
		padding: 10px;
		cursor: pointer;
		font-size: 16px;
		width: 40%;
		margin-bottom: 15px;
	}
</style>
