<script lang="ts">
	import { goto } from '$app/navigation';
	export let codigo_com;
	// Interfaz para representar un empleado
	
	interface Persona {
		codigo_com: number | undefined;
		direccion_com: string;
		monto_acreditado_com: number | undefined;
		fecha_inicio_operacion_com: Date | undefined;
		tipo_com: string;
		nacionalidad_com: string;
		fk_lugar: number | undefined;
		fk_usuario: number | undefined;
		tipo_persona_com: string;
		rif_jur: string;
		denominacion_persona_jur: string;
		razon_social_jur: string;
		pagina_web_jur: string;
		cedula_nat: string;
		primer_nombre_nat: string;
		segundo_nombre_nat: string;
		primer_apellido_nat: string;
		segundo_apellido_nat: string;
		telefonos: Telefono[];
		correos_electronicos: Correo_electronico[];
}

interface Telefono {
	codigo_tel: number | undefined;
	numero_telefono_tel: string;
	codigo_area_tel: string;
	fk_persona: number | undefined;
	fk_empleado: number | undefined;
}

interface Correo_electronico {
	codigo_ce: number | undefined;
	direccion_correo_ce: string;
	fk_persona: number | undefined;
	fk_empleado: number | undefined;
}

let telefonos: Telefono[] = [];
let correos: Correo_electronico[] = [];
let codigo_viejo: number;
let cliente_nat: Persona = {
	codigo_com: Math.floor(Math.random() * 5670) + 1,
	direccion_com: '',
	monto_acreditado_com: 0,
	fecha_inicio_operacion_com: new Date(),
	tipo_com: 'cliente',
	nacionalidad_com: '',
	fk_lugar: Math.floor(Math.random() * 360) + 1,
	fk_usuario: 185,
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

	// Función para manejar el envío del formulario
	async function registrarCliente() {
		console.log(cliente_nat);
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/cliente`, {
			method: 'POST',
			body: JSON.stringify(cliente_nat),
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
		goto('/admin/HomeAdmin/clientes');
	}
</script>

<form on:submit|preventDefault={registrarCliente}>
	<h2>Registrar Cliente</h2>

	<label for="usuario">Numero Usuario</label>
	<input id="usuario" bind:value={cliente_nat.fk_usuario} />

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

		<label for="codigotlf">Codigo</label>
		<input id="codigotlf" bind:value={telefono.codigo_tel} />

		<label for="CodigoArea">Codigo De Area</label>
		<input id="codigoArea" bind:value={telefono.codigo_area_tel} />

		<label for="telefono1">Numero de Telefono</label>
		<input id="telefono1" bind:value={telefono.numero_telefono_tel} />
		<button type="button" on:click={() => telefonos.push({ ...telefono })}>Agregar Teléfono</button>
	</div>

	<p style="display: block; font-weight: bold;">Correo</p>
	<p>(Para insertar varios, ingrese uno y despues el otro)</p>
	<div class="correo-container">

		<label for="codigoCor">Codigo</label>
		<input id="codigoCor" bind:value={correo.codigo_ce} />

		<label for="correo">Direccion de correo</label>
		<input id="correo" bind:value={correo.direccion_correo_ce} />
		<button type="button" on:click={() => correos.push({ ...correo })}>Agregar Correo</button>
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
