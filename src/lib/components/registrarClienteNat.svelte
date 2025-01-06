<script lang="ts">
	import { goto } from '$app/navigation';
	import type { Persona, Telefono, Correo_electronico } from '$lib/server/db/schema';
	// import { redirect } from '@sveltejs/kit';
	// import * as Bun  from 'bun';
	export let codigo_com: boolean | undefined, fk_usuario, id_editar: Persona | undefined;
	// let editar = $state(false);
	let cliente_nat: Persona;
	let codigo_viejo: number;
	if (id_editar != undefined) {
		cliente_nat = id_editar;
		if (id_editar.codigo_com) codigo_viejo = id_editar.codigo_com;
	} else {
		cliente_nat = {
			codigo_com: 0,
			direccion_com: '',
			monto_acreditado_com: 0,
			fecha_inicio_operacion_com: new Date(),
			tipo_com: 'cliente',
			nacionalidad_com: '',
			fk_lugar: Math.floor(Math.random() * 360) + 1,
			fk_usuario: fk_usuario,
			tipo_persona_com: 'natural',
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

	// Interfaz para representar un empleado

	let telefonos: Telefono[] = [];
	let correos: Correo_electronico[] = [];

	let telefono: Telefono = {
		codigo_tel: 0,
		numero_telefono_tel: '',
		codigo_area_tel: '',
		fk_persona: cliente_nat.codigo_com,
		fk_empleado: 0
	};

	let correo: Correo_electronico = {
		codigo_ce: 0,
		direccion_correo_ce: '',
		fk_persona: cliente_nat.codigo_com,
		fk_empleado: 0
	};

	async function decide() {
		if (id_editar == undefined) {
			registrarCliente();
		} else {
			actualizarCliente();
		}
	}

	async function actualizarCliente() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/editar/cliente`, {
			method: 'PUT',
			body: JSON.stringify({ cliente_nat: cliente_nat, codigo_viejo: codigo_viejo }), //Hay que enviar correos y telefonos tambien
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		goto('/admin/HomeAdmin/clientes');
	}

	// Función para manejar el envío del formulario
	async function registrarCliente() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/cliente`, {
			method: 'POST',
			body: JSON.stringify(cliente_nat),
			headers: { 'Content-Type': 'application/json' }
		});
		const argumento = await res.json();
		console.log('este es el argumento \n');
		console.log(argumento);

		// codigo_com = argumento.respuesta.id_persona;

		cliente_nat.codigo_com = argumento.id_persona;

		console.log(cliente_nat);

		telefonos.forEach((tel) => {
			tel.fk_persona = cliente_nat.codigo_com;
		});
		correos.forEach((cor) => {
			cor.fk_persona = cliente_nat.codigo_com;
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

		if (codigo_com) {
			goto('/cliente/productos');
		} else {
			goto(`/admin/HomeAdmin/clientes/`);
		}
	}
</script>

<form on:submit|preventDefault={decide}>
	<h2>Registrar Cliente natural</h2>

	<!-- <label for="usuario">Numero Usuario</label>
	<input id="usuario" bind:value={cliente_nat.fk_usuario} /> -->

	<label for="cedula">Cédula</label>
	<input id="cedula" bind:value={cliente_nat.cedula_nat} />

	<label for="primerNombre">Primer Nombre</label>
	<input id="primerNombre" bind:value={cliente_nat.primer_nombre_nat} />

	<label for="segundoNombre">Segundo Nombre</label>
	<input id="segundoNombre" bind:value={cliente_nat.segundo_nombre_nat} />

	<label for="primerApellido">Primer Apellido</label>
	<input id="primerApellido" bind:value={cliente_nat.primer_apellido_nat} />

	<label for="segundoApellido">Segundo Apellido</label>
	<input id="segundoApellido" bind:value={cliente_nat.segundo_apellido_nat} />

	<p style="display: block; font-weight: bold;">Telefono</p>
	<p>(Para insertar varios, ingrese uno y despues el otro)</p>
	<div class="telefono-container">
		<!-- <label for="codigotlf">Codigo</label>
		<input id="codigotlf" bind:value={telefono.codigo_tel} /> -->

		<label for="CodigoArea">Codigo De Area</label>
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
					fk_persona: cliente_nat.codigo_com,
					fk_empleado: 0
				};
				alert('Telefono añadido');
			}}>Agregar Teléfono</button
		>
	</div>

	<p style="display: block; font-weight: bold;">Correo</p>
	<p>(Para insertar varios, ingrese uno y despues el otro)</p>
	<div class="correo-container">
		<!-- <label for="codigoCor">Codigo</label>
		<input id="codigoCor" bind:value={correo.codigo_ce} /> -->

		<label for="correo">Direccion de correo</label>
		<input id="correo" bind:value={correo.direccion_correo_ce} />
		<button
			type="button"
			on:click={() => {
				correos.push({ ...correo });
				correo = {
					codigo_ce: correo.codigo_ce,
					direccion_correo_ce: '',
					fk_persona: cliente_nat.codigo_com,
					fk_empleado: 0
				};
				alert('Correo añadido');
			}}>Agregar Correo</button
		>
	</div>

	<label for="direccion">Dirección</label>
	<input id="direccion" bind:value={cliente_nat.direccion_com} />

	<label for="nacionalidad">Nacionalidad</label>
	<input id="nacionalidad" bind:value={cliente_nat.nacionalidad_com} />

	<button type="submit">Registrar Cliente</button>
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
