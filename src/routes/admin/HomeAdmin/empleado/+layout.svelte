<script lang="ts">
	import { goto } from "$app/navigation";

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Empleado {
		cedula_per: number;
		primer_nombre_per: string;
		segundo_nombre_per: string;
		primer_apellido_per: string;
		segundo_apellido_per: string;
		direccion_per: string;
		fecha_inicio_servicio_per: Date;
		experiencia_profesional_per: string;
		titulacion_per: string;
		sueldo_per: number;
		telefono_per: number[];
		correo_per: string[];
		labor_per:string;
	}

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let empleados: Empleado[] = [
		{
			cedula_per: 12345678,
			primer_nombre_per: 'Juan',
			segundo_nombre_per: 'Gabriel',
			primer_apellido_per: 'Pérez',
			segundo_apellido_per: 'Rodriguez',
			direccion_per: 'Calle Falsa 123',
			fecha_inicio_servicio_per: new Date('2021-01-01'),
			experiencia_profesional_per: '5 años',
			titulacion_per: 'Ingeniero en Informática',
			sueldo_per: 15000,
			telefono_per: [ 2121234567, 4161234567],
			correo_per: ['hola123@gmail.com', 'xyzcorreo@gmail.com'],
			labor_per:'Maquinista'
		},
		{
			cedula_per: 87654321,
			primer_nombre_per: 'María',
			segundo_nombre_per: 'Alejandra',
			primer_apellido_per: 'González',
			segundo_apellido_per: 'Urbina',
			direccion_per: 'Av. Siempreviva 742',
			fecha_inicio_servicio_per: new Date('2020-12-01'),
			experiencia_profesional_per: '3 años',
			titulacion_per: 'Licenciada en Administración',
			sueldo_per: 20000,
			telefono_per: [2129876543, 4146543210],
			correo_per: ['maria.gonzalez@example.com', 'mgonzalez@workemail.com'],
			labor_per:'Gerente'
		},
		{
			cedula_per: 13579246,
			primer_nombre_per: 'Carlos',
			segundo_nombre_per: 'Martínez',
			primer_apellido_per: 'Gómez',
			segundo_apellido_per: 'Leal',
			direccion_per: 'Carrera 8, Calle 10',
			fecha_inicio_servicio_per: new Date('2021-02-15'),
			experiencia_profesional_per: '2 años',
			titulacion_per: 'Licenciado en Comunicación Social',
			sueldo_per: 18000,
			telefono_per: [2125555555, 4165555555],
			correo_per: ['carlos.martinez@example.com', 'cmartinez@workemail.com'],
			labor_per:'Operador'
		}
		// Tus datos aquí
	];

	function editarRegistro(index: number) {
		// Lógica para editar el registro en 'datos'
		console.log(`Editando registro en índice ${index}`);
		goto(`/admin/HomeAdmin/editar/empleado/${index}`);
	}

	// Función para eliminar un registro
	function eliminarRegistro(index: number) {
		// Lógica para eliminar el registro en 'datos'
		console.log(`Eliminando registro en índice ${index}`);
	}
</script>

<h2>Empleados</h2>
<table>
	<thead>
		<tr>
			<th>Cedula</th>
			<th>Nombres</th>
			<th>Apellidos</th>
			<th>Telefono</th>
			<th>Direccion</th>
			<th>Fecha Inicio Servicio</th>
			<th>Experiencia Profesional</th>
			<th>Titulacion</th>
			<th>Sueldo</th>
			<th>Telefono</th>
			<th>Correo</th>
			<th>Labor</th>
		</tr>
	</thead>
	<tbody>
		{#each empleados as dato, i}
			<tr>
				<td>{dato.cedula_per}</td>
				<td>{dato.primer_nombre_per} {' '} {dato.segundo_nombre_per}</td>
				<td>{dato.primer_apellido_per} {' '} {dato.segundo_apellido_per}</td>
				<td>{dato.telefono_per}</td>
				<td>{dato.direccion_per}</td>
				<td>{dato.fecha_inicio_servicio_per}</td>
				<td>{dato.experiencia_profesional_per}</td>
				<td>{dato.titulacion_per}</td>
				<td>{dato.sueldo_per}</td>
				<td>{dato.telefono_per}</td>
				<td>{dato.correo_per}</td>
				<td>{dato.labor_per}</td>
				<td>
					<div class="botonesUD">
							<button on:click={() => editarRegistro(dato.cedula_per)}>
								<span>✏️</span>
								<!-- Icono de lápiz -->
							</button>
						<button on:click={() => eliminarRegistro(dato.cedula_per)}>
							<span>🗑️</span>
							<!-- Icono de papelera -->
						</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/empleado">
	<button>Registrar Empleado</button>
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
