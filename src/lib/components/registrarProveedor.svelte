<script lang="ts">
	import type { Proveedor, Telefono,Correo_electronico} from '$lib/server/db/schema';
	export let id_editar: Proveedor;
	import { goto } from '$app/navigation';
	
	let proveedor: Proveedor;
	let telefonos: Telefono[] = [];
	let correos: Correo_electronico[] = [];
	let codigo_viejo: number;

	if (id_editar!=undefined) {
		proveedor = id_editar;
		if (id_editar.codigo_com)
		codigo_viejo=id_editar.codigo_com
	} else {
		proveedor = {
			codigo_com: Math.floor(Math.random() * 5670) + 1,
			direccion_com: '',
			monto_acreditado_com: 0,
			fecha_inicio_operaciones_com: new Date(),
			tipo_com: 'proveedor',
			nacionalidad_com: '',
			fk_lugar: Math.floor(Math.random() * 360) + 1,
			fk_usuario: 185,
			tipo_persona_com: 'juridico',
			rif_jur: '',
			denominacion_persona_jur: '',
			razon_social_jur: '',
			pagina_web_jur: '',
			cedula_nat: '',
			primer_nombre_nat: '',
			segundo_nombre_nat: '',
			primer_apellido_nat: '',
			segundo_apellido_nat: '',
			telefonos: [],
			correos_electronicos: []
		};
	}
	let telefono: Telefono = {
			codigo_tel: 21,
			numero_telefono_tel: '',
			codigo_area_tel: '',
			fk_persona: proveedor.codigo_com,
			fk_empleado: 0
		};

		let correo: Correo_electronico = {
			codigo_ce: 21,
			direccion_correo_ce: '',
			fk_persona: proveedor.codigo_com,
			fk_empleado: 0
		};

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

		for (let tel of telefonos) {
			console.log(tel);
			await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/telefono`, {
				method: 'POST',
				body: JSON.stringify(tel),
				headers: { 'Content-Type': 'application/json' }
			});
		}

		for (let cor of correos) {
			console.log(cor);
			await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/correo`, {
				method: 'POST',
				body: JSON.stringify(cor),
				headers: { 'Content-Type': 'application/json' }
			});
		}
		const data = await res.json();

		goto('/admin/HomeAdmin/aliados');
	}

</script>

<form on:submit|preventDefault={registrarProveedor}>
	<h2>Registrar Proveedor</h2>

	<label for="codigo">Codigo</label>
	<input id="codigo" bind:value={proveedor.codigo_com} />

	<label for="rif">RIF</label>
	<input id="rif" bind:value={proveedor.rif_jur} />

	<label for="denominacion">Denominacion comercial</label>
	<input id="denominacion" bind:value={proveedor.denominacion_persona_jur} />

	<label for="razon">Razon social</label>
	<input id="razon" bind:value={proveedor.razon_social_jur} />

	<label for="paginaweb">Pagina web</label>
	<input id="paginaweb" bind:value={proveedor.pagina_web_jur} />

	<div class="telefono-container">
		<label for="CodigoArea">Codigo De Area</label>
		<input id="telefono1" bind:value={telefono.codigo_area_tel} />

		<label for="telefono1">Telefono</label>
		<input id="telefono1" bind:value={telefono.numero_telefono_tel} />
		<button type="button" on:click={() => telefonos.push({ ...telefono })}>Agregar Teléfono</button>
	</div>

	<div class="correo-container">
	<label for="correo">Correo</label>
	<input id="correo" bind:value={correo.direccion_correo_ce} />
	<button type="button" on:click={() => correos.push({ ...correo })}>Agregar Correo</button>
	</div>

	<label for="direccion">Direccion</label>
	<input id="direccion" bind:value={proveedor.direccion_com} />

	<label for="monto">Monto acreditado</label>
	<input id="monto" bind:value={proveedor.monto_acreditado_com} />

	<label for="fechaInicio">Fecha de Inicio de Operaciones</label>
	<input id="fechaInicio" type="date" bind:value={proveedor.fecha_inicio_operaciones_com} />

	<button type="submit">Registrar Proveedor</button>
	
</form>

<style>
	/* Estilos generales para el formulario */

	.telefono-container {
		display: flex;
		flex-direction: row;
	}

	.correo-container {
		display: flex;
		flex-direction: row;
	}
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
