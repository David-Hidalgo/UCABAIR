<script lang="ts">
	import { goto } from "$app/navigation";

	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Cliente {
		cedula_nat: number;
		primer_nombre_nat: string;
		segundo_nombre_nat: string;
		primer_apelido_nat: string;
		segundo_apelido_nat: string;
		telefono_com: number[];
		correo_com: string[];
		direccion_com: string;
		monto_acreditado_com: number;
		fecha_inicio_operaciones_com: Date;
		tipo_com: string;
	}

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let datos: Cliente[] = [
		{
			cedula_nat: 27660324,
			primer_nombre_nat: 'Juan',
			segundo_nombre_nat: 'Gabriel',
			primer_apelido_nat: 'Pérez',
			segundo_apelido_nat: 'Rodriguez',
			telefono_com: [123456789, 987654321],
			correo_com: ['juan.perez@example.com'],
			direccion_com: 'Calle Falsa 123',
			monto_acreditado_com: 100000,
			fecha_inicio_operaciones_com: new Date('2021-01-01'),
			tipo_com: 'Natural'
		},
		{
			cedula_nat: 12345678,
			primer_nombre_nat: 'María',
			segundo_nombre_nat: 'Alejandra',
			primer_apelido_nat: 'González',
			segundo_apelido_nat: 'Urbina',
			telefono_com: [987654321, 123456789],
			correo_com: ['maria.gonzalez@example.com'],
			direccion_com: 'Avenida Siempre Viva 456',
			monto_acreditado_com: 200000,
			fecha_inicio_operaciones_com: new Date('2021-02-01'),
			tipo_com: 'Natural'
		},
		{
			cedula_nat: 34567890,
			primer_nombre_nat: 'Carlos',
			segundo_nombre_nat: 'Jose',
			primer_apelido_nat: 'Rodríguez',
			segundo_apelido_nat: 'Leal',
			telefono_com: [829719138, 123456789],
			correo_com: ['carlos.rodriguez@example.com'],
			direccion_com: 'Boulevard de los Sueños Rotos 789',
			monto_acreditado_com: 300000,
			fecha_inicio_operaciones_com: new Date('2021-03-01'),
			tipo_com: 'Natural'
		}
		// Puedes agregar más registros aquí
		// Tus datos aquí
	];

	function editarRegistro(index: number) {
		// Lógica para editar el registro en 'datos'
		console.log(`Editando registro en índice ${index}`);
		goto(`/admin/HomeAdmin/editar/cliente/${index}`);
	}

	// Función para eliminar un registro
	function eliminarRegistro(index: number) {
		// Lógica para eliminar el registro en 'datos'
		console.log(`Eliminando registro en índice ${index}`);
	}
</script>

<h2>Clientes</h2>
<table>
	<thead>
		<tr>
			<th>Cédula</th>
			<th>Nombres</th>
			<th>Apellidos</th>
			<th>Teléfono</th>
			<th>Correo</th>
			<th>Dirección</th>
		</tr>
	</thead>
	<tbody>
		{#each datos as dato, i}
			<tr>
				<td>{dato.cedula_nat}</td>
				<td>{dato.primer_nombre_nat} {' '} {dato.segundo_nombre_nat}</td>
				<td>{dato.primer_apelido_nat} {' '} {dato.segundo_apelido_nat}</td>
				<td>{dato.telefono_com}</td>
				<td>{dato.correo_com}</td>
				<td>{dato.direccion_com}</td>
				<td>{dato.monto_acreditado_com}</td>
				<td>{dato.fecha_inicio_operaciones_com}</td>
				<td>
					<div class="botonesUD">
						<button on:click={() => editarRegistro(dato.cedula_nat)}>
							<span>✏️</span>
							<!-- Icono de lápiz -->
						</button>
						<button on:click={() => eliminarRegistro(dato.cedula_nat)}>
							<span>🗑️</span>
							<!-- Icono de papelera -->
						</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/cliente">
	<button>Registrar Cliente</button>
</a>

<style>
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
