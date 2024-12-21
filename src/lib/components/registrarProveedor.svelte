<script lang="ts">
	import type { Proveedor } from '$lib/server/db/schema';
	export let id_editar: Proveedor | undefined;
	import { goto } from '$app/navigation';
	
	let proveedor: Proveedor;
	let codigo_viejo: number;

	if (id_editar!=undefined) {
		proveedor = id_editar;
		if (id_editar.codigo_com)
		codigo_viejo=id_editar.codigo_com
	} else {
		proveedor = {
	codigo_com: undefined,
	rif_jur: '',
	denominacion_persona_jur: '',
	razon_social_jur: '',
	pagina_web_jur: '',
	//telefono_com: undefined,
	//correo_com: '',
	direccion_com: '',
	monto_acreditado_com:undefined,
	fecha_inicio_operaciones_com:undefined
		};
	}
	async function decide() {
		
		if (id_editar==undefined) {
			registrarProveedor();
		} else {
			actualizarProveedor()
		}
	}

	// Función para manejar el envío del formulario
	async function actualizarProveedor() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/editar/aliado`, {
			method: 'PUT',
			body: JSON.stringify({proveedor:proveedor , codigo_viejo:codigo_viejo}),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		alert('Proveedor modificado con exito');
		goto('/admin/HomeAdmin/aliado');
	}
	async function registrarProveedor() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/aliado`, {
			method: 'POST',
			body: JSON.stringify(proveedor),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();


		alert('Proveedor agregado con exito');
		goto('/admin/HomeAdmin/aliado');
	}
</script>

<form on:submit|preventDefault={registrarProveedor}>
	<h2>Registrar Proveedor</h2>

	<label for="rif">RIF</label>
	<input id="rif" bind:value={proveedor.rif_jur} />

	<label for="denominacion">Denominacion comercial</label>
	<input id="denominacion" bind:value={proveedor.denominacion_persona_jur} />

	<label for="razon">Razon social</label>
	<input id="razon" bind:value={proveedor.razon_social_jur} />

	<label for="paginaweb">Pagina web</label>
	<input id="paginaweb" bind:value={proveedor.pagina_web_jur} />

	<label for="direccion">Direccion</label>
	<input id="direccion" bind:value={proveedor.direccion_com} />

	<label for="monto">Monto acreditado</label>
	<input id="monto" bind:value={proveedor.monto_acreditado_com} />

	<label for="fechaInicio">Fecha de Inicio de Operaciones</label>
	<input id="fechaInicio" type="date" bind:value={proveedor.fecha_inicio_operaciones_com} />
	
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
