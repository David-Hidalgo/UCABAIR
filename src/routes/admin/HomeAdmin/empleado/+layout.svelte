<script lang="ts">
	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Empleados';
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Empleado {
		cedula: string;
		nombres: string;
		apellidos: string;
		telefono: string[];
		correo: string[];
		area_trabajo: string;
		sueldo: string;
		especialidad: string;
		rol: string;
	}

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let empleados: Empleado[] = [
		{
			cedula: 'V-12345678',
			nombres: 'Juan',
			apellidos: 'Pérez',
			telefono: ['+58-212-1234567', '+58-412-7654321'],
			correo: ['juan.perez@example.com', 'jperez@workemail.com'],
			area_trabajo: 'Ingeniería',
			sueldo: '2500$',
			especialidad: 'Desarrollo de Software',
			rol: 'empleado'
		},
		{
			cedula: 'E-87654321',
			nombres: 'María',
			apellidos: 'González',
			telefono: ['+58-212-7654321', '+58-416-1234567'],
			correo: ['maria.gonzalez@example.com', 'mgonzalez@workemail.com'],
			area_trabajo: 'Recursos Humanos',
			sueldo: '2000$',
			especialidad: 'Gestión del Talento',
			rol: 'empleado'
		},
		{
			cedula: 'V-12344321',
			nombres: 'Carlos',
			apellidos: 'Martínez',
			telefono: ['+58-212-9876543', '+58-414-6543210'],
			correo: ['carlos.martinez@example.com', 'cmartinez@workemail.com'],
			area_trabajo: 'Marketing',
			sueldo: '2200$',
			especialidad: 'Estrategia Digital',
			rol: 'admin'
		}
		// Tus datos aquí
	];

	function editarRegistro(index: number) {
		// Lógica para editar el registro en 'datos'
		console.log(`Editando registro en índice ${index}`);
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
			<th>Teléfono</th>
			<th>Correo</th>
			<th>Area de Trabajo</th>
			<th>Sueldo</th>
			<th>Especialidad</th>
			<th>Rol</th>
		</tr>
	</thead>
	<tbody>
		{#each empleados as dato, i}
			<tr>
				<td>{dato.cedula}</td>
				<td>{dato.nombres}</td>
				<td>{dato.apellidos}</td>
				<td>{dato.telefono}</td>
				<td>{dato.correo}</td>
				<td>{dato.area_trabajo}</td>
				<td>{dato.sueldo}</td>
				<td>{dato.especialidad}</td>
				<td>{dato.rol}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/empleado">
							<button on:click={() => editarRegistro(i)}>
								<span>✏️</span>
								<!-- Icono de lápiz -->
							</button>
						</a>
						<button on:click={() => eliminarRegistro(i)}>
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
<a href="/admin/HomeAdmin/reponerInventario/solicitarPersonal">
	<button>Solicitar Personal</button>
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
