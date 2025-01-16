<script lang="ts">
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
	import type { Persona, Telefono, Correo_electronico, Usuario } from './+page.server.ts';
	import { goto } from '$app/navigation';
	let { data }: { data: PageData } = $props();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}

	let usuarios: Usuario[] = new Array();
	for (let index = 0; index < data.user_table.length; index++) {
		let usuario: Usuario = {
			codigo_usu: undefined,
			nombre_usu: '',
			contrasena_usu: '',
			fk_rol: undefined
		};
		usuario.codigo_usu = data.user_table[index].codigo_usu;
		usuario.nombre_usu = data.user_table[index].nombre_usu;
		usuario.contrasena_usu = data.user_table[index].contrasena_usu;
		usuario.fk_rol = data.user_table[index].fk_rol;
		usuarios.push(usuario);
	}

	let telefonos: Telefono[] = new Array();
	for (let index = 0; index < data.tel_table.length; index++) {
		let telefono: Telefono = {
			codigo_tel: undefined,
			numero_telefono_tel: '',
			codigo_area_tel: '',
			fk_persona: undefined,
			fk_empleado: undefined
		};
		telefono.codigo_tel = data.tel_table[index].codigo_tel;
		telefono.numero_telefono_tel = data.tel_table[index].numero_telefono_tel;
		telefono.codigo_area_tel = data.tel_table[index].codigo_area_tel;
		telefono.fk_persona = data.tel_table[index].fk_persona;
		if (telefono.fk_persona === undefined) {
			telefono.numero_telefono_tel = 'No hay telefonos asociados';
		}
		telefono.fk_empleado = data.tel_table[index].fk_empleado;
		telefonos.push(telefono);
	}

	let correos: Correo_electronico[] = new Array();
	for (let index = 0; index < data.email_table.length; index++) {
		let correo: Correo_electronico = {
			codigo_ce: undefined,
			direccion_correo_ce: '',
			fk_persona: undefined,
			fk_empleado: undefined
		};
		correo.codigo_ce = data.email_table[index].codigo_ce;
		correo.direccion_correo_ce = data.email_table[index].direccion_correo_ce;
		correo.fk_persona = data.email_table[index].fk_persona;
		if (correo.fk_persona === undefined) {
			correo.direccion_correo_ce = 'No hay correos asociados';
		}
		correo.fk_empleado = data.email_table[index].fk_empleado;
		correos.push(correo);
	}

	let clientes_nat: Persona[] = new Array();
	for (let index = 0; index < data.nat_table.length; index++) {
		let persona_nat: Persona = {
			codigo_com: undefined,
			direccion_com: '',
			monto_acreditado_com: undefined,
			fecha_inicio_operacion_com: new Date(),
			tipo_com: 'natural',
			nacionalidad_com: '',
			fk_lugar: undefined,
			fk_usuario: undefined,
			tipo_persona_com: 'cliente',
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
		persona_nat.codigo_com = data.nat_table[index].codigo_com;
		persona_nat.direccion_com = data.nat_table[index].direccion_com;
		persona_nat.monto_acreditado_com = data.nat_table[index].monto_acreditado_com;
		persona_nat.fecha_inicio_operacion_com = data.nat_table[index].fecha_inicio_operacion_com;
		persona_nat.tipo_com = data.nat_table[index].tipo_com;
		persona_nat.nacionalidad_com = data.nat_table[index].nacionalidad_com;
		persona_nat.fk_lugar = data.nat_table[index].fk_lugar;
		persona_nat.fk_usuario = data.nat_table[index].fk_usuario;
		persona_nat.tipo_persona_com = data.nat_table[index].tipo_persona_com;
		persona_nat.cedula_nat = data.nat_table[index].cedula_nat;
		persona_nat.primer_nombre_nat = data.nat_table[index].primer_nombre_nat;
		persona_nat.segundo_nombre_nat = data.nat_table[index].segundo_nombre_nat;
		persona_nat.primer_apellido_nat = data.nat_table[index].primer_apellido_nat;
		persona_nat.segundo_apellido_nat = data.nat_table[index].segundo_apellido_nat;
		// Obtener los teléfonos de la persona
		persona_nat.telefonos = telefonos.filter(
			(telefono) => telefono.fk_persona === persona_nat.codigo_com
		);
		// Obtener los correos electrónicos de la persona
		persona_nat.correos_electronicos = correos.filter(
			(correo) => correo.fk_persona === persona_nat.codigo_com
		);
		clientes_nat.push(persona_nat);
	}

	let clientes_jur: Persona[] = new Array();
	for (let index = 0; index < data.jur_table.length; index++) {
		let persona_jur: Persona = {
			codigo_com: undefined,
			direccion_com: '',
			monto_acreditado_com: undefined,
			fecha_inicio_operacion_com: new Date(),
			tipo_com: 'juridico',
			nacionalidad_com: '',
			fk_lugar: undefined,
			fk_usuario: undefined,
			tipo_persona_com: '',
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
		persona_jur.codigo_com = data.jur_table[index].codigo_com;
		persona_jur.direccion_com = data.jur_table[index].direccion_com;
		persona_jur.monto_acreditado_com = data.jur_table[index].monto_acreditado_com;
		persona_jur.fecha_inicio_operacion_com = data.jur_table[index].fecha_inicio_operacion_com;
		persona_jur.tipo_com = data.jur_table[index].tipo_com;
		persona_jur.nacionalidad_com = data.jur_table[index].nacionalidad_com;
		persona_jur.fk_lugar = data.jur_table[index].fk_lugar;
		persona_jur.fk_usuario = data.jur_table[index].fk_usuario;
		persona_jur.tipo_persona_com = data.jur_table[index].tipo_persona_com;
		persona_jur.rif_jur = data.jur_table[index].rif_jur;
		persona_jur.denominacion_persona_jur = data.jur_table[index].denominacion_persona_jur;
		persona_jur.razon_social_jur = data.jur_table[index].razon_social_jur;
		persona_jur.pagina_web_jur = data.jur_table[index].pagina_web_jur;
		// Obtener los teléfonos de la persona
		persona_jur.telefonos = telefonos.filter(
			(telefono) => telefono.fk_persona === persona_jur.codigo_com
		);
		// Obtener los correos electrónicos de la persona
		persona_jur.correos_electronicos = correos.filter(
			(correo) => correo.fk_persona === persona_jur.codigo_com
		);
		clientes_jur.push(persona_jur);
	}

	async function editarRegistro(persona: Persona) {
		//    goto(`/admin/HomeAdmin/editar/cliente/${persona.codigo_com}`);
	}

	async function eliminarRegistro(persona: Persona) {
		await fetch(`/admin/HomeAdmin/clientes`, {
			method: 'DELETE',

			body: JSON.stringify(persona.codigo_com)
		});
		location.reload();
	}
</script>

<h2>Clientes Naturales</h2>
<div class="clientesNaturales">
	<table>
		<thead>
			<tr>
				<th>Cédula</th>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Teléfono</th>
				<th>Correo</th>
				<th>Usuario</th>
				<th>Dirección</th>
				<th>Monto Acreditado</th>
				<th>Fecha Inicio Operación</th>
			</tr>
		</thead>
		<tbody>
			{#each clientes_nat as dato}
				<tr>
					<td>{dato.cedula_nat}</td>
					<td>{dato.primer_nombre_nat} {' '} {dato.segundo_nombre_nat}</td>
					<td>{dato.primer_apellido_nat} {' '} {dato.segundo_apellido_nat}</td>
					<td>{dato.telefonos.map((tel) => tel.numero_telefono_tel).join(', ')}</td>
					<td>{dato.correos_electronicos.map((correo) => correo.direccion_correo_ce).join(', ')}</td
					>
					<td>{usuarios.find((usuario) => usuario.codigo_usu === dato.fk_usuario)?.nombre_usu}</td>
					<td>{dato.direccion_com}</td>
					<td>{dato.monto_acreditado_com}</td>
					<td>{dato.fecha_inicio_operacion_com}</td>
					<td>
						<div class="botonesUD">
							<a href="/admin/HomeAdmin/editar/cliente/{dato.codigo_com}?tipo=natural ">
								<button onclick={() => editarRegistro(dato)}>
									<span>✏️</span>
									<!-- Icono de lápiz -->
								</button>
							</a>
							<button onclick={() => eliminarRegistro(dato)}>
								<span>🗑️</span>
								<!-- Icono de papelera -->
							</button>
						</div>
					</td>
				</tr>
			{/each}
		</tbody>
	</table>
</div>

<h2>Clientes Juridicos</h2>
<div class="clientesJuridicos">
	<table>
		<thead>
			<tr>
				<th>Rif</th>
				<th>Razon Social</th>
				<th>Denominacion Social</th>
				<th>Nacionalidad</th>
				<th>Teléfono</th>
				<th>Correo</th>
				<th>Usuario</th>
				<th>Dirección</th>
				<th>Monto Acreditado</th>
				<th>Fecha Inicio Operación</th>
			</tr>
		</thead>
		<tbody>
			{#each clientes_jur as dato}
				<tr>
					<td>{dato.rif_jur}</td>
					<td>{dato.razon_social_jur}</td>
					<td>{dato.denominacion_persona_jur}</td>
					<td>{dato.nacionalidad_com}</td>
					<td>{dato.telefonos.map((tel) => tel.numero_telefono_tel).join(', ')}</td>
					<td>{dato.correos_electronicos.map((correo) => correo.direccion_correo_ce).join(', ')}</td
					>
					<td>{usuarios.find((usuario) => usuario.codigo_usu === dato.fk_usuario)?.nombre_usu}</td>
					<td>{dato.direccion_com}</td>
					<td>{dato.monto_acreditado_com}</td>
					<td>{dato.fecha_inicio_operacion_com}</td>
					<td>
						<div class="botonesUD">
							<a href="/admin/HomeAdmin/editar/cliente/{dato.codigo_com}?tipo=juridico">
								<button onclick={() => editarRegistro(dato)}>
									<span>✏️</span>
									<!-- Icono de lápiz -->
								</button>
							</a>
							<button onclick={() => eliminarRegistro(dato)}>
								<span>🗑️</span>
								<!-- Icono de papelera -->
							</button>
						</div>
					</td>
				</tr>
			{/each}
		</tbody>
	</table>
</div>

<a href="/admin/HomeAdmin/registrar/cliente">
	<button>Registrar Cliente</button>
</a>

<style>
	.clientesNaturales,
	.clientesJuridicos {
		border: 1px solid gray;
		max-height: 400px;
		overflow-y: auto;
	}

	.botonesUD {
		display: flex;
		background-color: white;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
	}
	table {
		width: 100%;
		border-collapse: collapse;
	}
	th,
	td {
		border: 1px solid #adadad;
		padding: 8px;
		text-align: left;
		font-family: 'Baskervville';
		font-style: light;
		align-items: center;
		text-align: center;
		letter-spacing: -0.03em;
	}
	thead {
		background-color: white;
	}

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
