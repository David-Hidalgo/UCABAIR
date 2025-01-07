<script lang="ts">
	import type { Empleado, Telefono, Correo_electronico } from '$lib/server/db/schema';
	export let id_editar: Empleado | undefined, fk_usuario: number;
	import { goto } from '$app/navigation';
	import { format } from 'date-fns';

	let empleado: Empleado;
	let codigo_viejo: number;
	let telefonos: Telefono[] = [];
	let correos: Correo_electronico[] = [];

	if (id_editar != undefined) {
		empleado = id_editar;
		if (id_editar.codigo_empleado_per) codigo_viejo = id_editar.codigo_empleado_per;
	} else {
		empleado = {
			codigo_empleado_per: 0,
			cedula_per: '',
			primer_nombre_per: '',
			segundo_nombre_per: '',
			primer_apellido_per: '',
			segundo_apellido_per: '',
			direccion_per: '',
			fecha_inicio_servicio_per: new Date(),
			empleado_profesion: [],
			sueldo_per: 0,
			telefono_per: [],
			correo_per: [],
			fk_lugar: Math.floor(Math.random() * 300) + 1,
			fk_usuario: fk_usuario
		};
	}

	let telefono: Telefono = {
		codigo_tel: 0,
		numero_telefono_tel: '',
		codigo_area_tel: '',
		fk_persona: 0,
		fk_empleado: empleado.codigo_empleado_per
	};

	let correo: Correo_electronico = {
		codigo_ce: 0,
		direccion_correo_ce: '',
		fk_persona: 0,
		fk_empleado: empleado.codigo_empleado_per
	};

	async function decide() {
		if (id_editar == undefined) {
			registrarEmpleado();
		} else {
			actualizarEmpleado();
		}
	}

	// Función para manejar el envío del formulario
	async function actualizarEmpleado() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/editar/empleado`, {
			method: 'PUT',
			body: JSON.stringify({ empleado: empleado, codigo_viejo: codigo_viejo }),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		alert('Empleado modificado con exito');
		goto('/admin/HomeAdmin/empleado');
	}
	async function registrarEmpleado() {
		console.log(empleado);
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/empleado`, {
			method: 'POST',
			body: JSON.stringify(empleado),
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
		goto('/admin/HomeAdmin/empleado');
	}
</script>

<form onsubmit={decide}>
	<h2>Registrar Empleado</h2>

	<label for="codigo">Codigo Empleado</label>
	<input id="codigo" bind:value={empleado.codigo_empleado_per} />

	<label for="cedula">Cédula</label>
	<input id="cedula" bind:value={empleado.cedula_per} />

	<label for="primerNombre">Primer Nombre</label>
	<input id="primerNombre" bind:value={empleado.primer_nombre_per} />

	<label for="segundoNombre">Segundo Nombre</label>
	<input id="segundoNombre" bind:value={empleado.segundo_nombre_per} />

	<label for="primerApellido">Primer Apellido</label>
	<input id="primerApellido" bind:value={empleado.primer_apellido_per} />

	<label for="segundoApellido">Segundo Apellido</label>
	<input id="segundoApellido" bind:value={empleado.segundo_apellido_per} />

	<p style="display: block; font-weight: bold;">Telefono</p>
	<p>(Para insertar varios, ingrese uno y despues el otro)</p>
	<div class="telefono-container">

		<label for="CodigoArea">Codigo De Area</label>
		<input id="codigoArea" bind:value={telefono.codigo_area_tel} />

		<label for="telefono1">Numero de Telefono</label>
		<input id="telefono1" bind:value={telefono.numero_telefono_tel} />
		<button
			type="button"
			onclick={() => {
				telefonos.push({ ...telefono });
				telefono = {
					codigo_tel: telefono.codigo_tel,
					numero_telefono_tel: '',
					codigo_area_tel: '',
					fk_persona: 0,
					fk_empleado: empleado.codigo_empleado_per
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
			onclick={() => {
				correos.push({ ...correo });
				correo = {
					codigo_ce: correo.codigo_ce ,
					direccion_correo_ce: '',
					fk_persona: 0,
					fk_empleado: empleado.codigo_empleado_per
				};
				alert('Correo añadido');
			}}>Agregar Correo</button
		>
	</div>

	<label for="direccion">Dirección</label>
	<input id="direccion" bind:value={empleado.direccion_per} />

	<label for="fechaInicio">Fecha de Inicio de Servicio</label>
	<input
		id="fechaInicio"
		type="date"
		bind:value={empleado.fecha_inicio_servicio_per}
		onchange={() => {
			console.log(empleado.fecha_inicio_servicio_per);
		}}
	/>

	<label for="sueldo">Sueldo</label>
	<input id="sueldo" bind:value={empleado.sueldo_per} />

	<button type="submit">Registrar Empleado</button>
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
