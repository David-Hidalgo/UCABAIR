<script lang="ts">
	import type { Proveedor, Telefono, Correo_electronico } from '$lib/server/db/schema';
	export let id_editar: Proveedor | undefined;
	export let fk_usuario: number | undefined;
	import { goto } from '$app/navigation';

	let proveedor: Proveedor;
	export let telefonos: Telefono[] = [];
	export let correos: Correo_electronico[] = [];
	let codigo_viejo: number;

	if (id_editar != undefined) {
		proveedor = id_editar;
		if (id_editar.codigo_com) codigo_viejo = id_editar.codigo_com;
	} else {
		proveedor = {
			codigo_com: 0,
			direccion_com: '',
			monto_acreditado_com: 0,
			fecha_inicio_operaciones_com: new Date(),
			tipo_com: 'proveedor',
			nacionalidad_com: '',
			fk_lugar: 1,
			fk_usuario: fk_usuario,
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
		codigo_tel: 0,
		numero_telefono_tel: '',
		codigo_area_tel: '',
		fk_persona: proveedor.codigo_com,
		fk_empleado: 0
	};

	let correo: Correo_electronico = {
		codigo_ce: 0,
		direccion_correo_ce: '',
		fk_persona: proveedor.codigo_com,
		fk_empleado: 0
	};

	async function decide() {
		if (id_editar == undefined) {
			registrarProveedor();
		} else {
			actualizarProveedor();
		}
	}

	// Función para manejar el envío del formulario
	async function actualizarProveedor() {
		console.log('he aquí el proveedor: \n');
		console.log(proveedor);
		console.log('he aquí el codigo Viejo: ' + codigo_viejo);
		const res = await fetch(`/admin/HomeAdmin/editar/aliado`, {
			method: 'PUT',
			body: JSON.stringify({
				direccion: proveedor.direccion_com,
				monto_acreditado: proveedor.monto_acreditado_com,
				fecha_inicio_operacion: proveedor.fecha_inicio_operaciones_com,
				tipo: proveedor.tipo_com,
				nacionalidad: proveedor.nacionalidad_com,
				fk_lugar: proveedor.fk_lugar,
				fk_usuario: proveedor.fk_usuario,
				tipo_persona: proveedor.tipo_persona_com,
				rif: proveedor.rif_jur,
				denominacion_persona: proveedor.denominacion_persona_jur,
				razon_social: proveedor.razon_social_jur,
				pagina_web: proveedor.pagina_web_jur,
				viejo_codigo: codigo_viejo
			}),
			headers: { 'Content-Type': 'application/json' }
		});
		alert('Proveedor modificado con exito');
		goto('/admin/HomeAdmin/aliados');
	}
	async function registrarProveedor() {
		console.log('he aquí el proveedor: \n');
		console.log(proveedor);
		const res = await fetch(`/admin/HomeAdmin/registrar/aliado`, {
			method: 'POST',
			body: JSON.stringify(proveedor),
			headers: { 'Content-Type': 'application/json' }
		});
		const argumento = await res.json();
		console.log(argumento);

		proveedor.codigo_com = argumento.respuesta.id_persona;

		console.log(proveedor);

		telefonos.forEach((tel) => {
			tel.fk_persona = proveedor.codigo_com;
		});
		correos.forEach((cor) => {
			cor.fk_persona = proveedor.codigo_com;
		});
		//
		for (let tel of telefonos) {
			await fetch(`/admin/HomeAdmin/registrar/telefono`, {
				method: 'POST',
				body: JSON.stringify(tel),
				headers: { 'Content-Type': 'application/json' }
			});
		}
		for (let cor of correos) {
			console.log(cor);
			await fetch(`/admin/HomeAdmin/registrar/correo`, {
				method: 'POST',
				body: JSON.stringify(cor),
				headers: { 'Content-Type': 'application/json' }
			});
		}

		goto('/admin/HomeAdmin/aliados');
	}
</script>

<form on:submit|preventDefault={decide}>
	<h2>Registrar Proveedor</h2>

	<label for="rif">RIF</label>
	<input id="rif" bind:value={proveedor.rif_jur} />

	<label for="denominacion">Denominacion comercial</label>
	<input id="denominacion" bind:value={proveedor.denominacion_persona_jur} />

	<label for="razon">Razon social</label>
	<input id="razon" bind:value={proveedor.razon_social_jur} />

	<label for="paginaweb">Pagina web</label>
	<input id="paginaweb" bind:value={proveedor.pagina_web_jur} />

	<p style="display: block; font-weight: bold;">Telefono</p>
	<p>(Para insertar varios, ingrese uno y despues el otro)</p>
	<div class="telefono-container">
		<label for="codigoArea">Codigo De Area</label>
		<input id="codigoArea" bind:value={telefono.codigo_area_tel} />

		<label for="telefono1">Numero de Telefono</label>
		<input id="telefono1" bind:value={telefono.numero_telefono_tel} />
		<button
			type="button"
			on:click={() => {
				telefonos.push({ ...telefono });
				telefono = {
					codigo_tel: telefono.codigo_tel,
					numero_telefono_tel: '',
					codigo_area_tel: '',
					fk_persona: proveedor.codigo_com,
					fk_empleado: 0
				};
				alert('Telefono añadido');
			}}>Agregar Teléfono</button
		>
	</div>

	<p style="display: block; font-weight: bold;">Correo</p>
	<p>(Para insertar varios, ingrese uno y despues el otro)</p>
	<div class="correo-container">
		<label for="correo">Direccion de correo</label>
		<input id="correo" bind:value={correo.direccion_correo_ce} />
		<button
			type="button"
			on:click={() => {
				correos.push({ ...correo });
				correo = {
					codigo_ce: correo.codigo_ce,
					direccion_correo_ce: '',
					fk_persona: proveedor.codigo_com,
					fk_empleado: 0
				};
				alert('Correo añadido');
			}}>Agregar Correo</button
		>
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
