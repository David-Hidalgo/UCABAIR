<script lang="ts">
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Cliente {
		cedula: string;
		nombres: string;
		apellidos: string;
		telefono: string[];
		correo: string[];
		direccion: string;
	}

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let datos: Cliente[] = [
		{
			cedula: '27660324',
			nombres: 'Juan',
			apellidos: 'Pérez',
			telefono: ['123456789', '987654321'],
			correo: ['juan.perez@example.com'],
			direccion: 'Calle Falsa 123'
		},
		{
			cedula: '22931928',
			nombres: 'María',
			apellidos: 'González',
			telefono: ['234567890'],
			correo: ['maria.gonzalez@example.com'],
			direccion: 'Avenida Siempre Viva 456'
		},
		{
			cedula: '39029839',
			nombres: 'Carlos',
			apellidos: 'Rodríguez',
			telefono: ['345678901', '765432109'],
			correo: ['carlos.rodriguez@example.com'],
			direccion: 'Boulevard de los Sueños Rotos 789'
		}
		// Puedes agregar más registros aquí
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
				<td>{dato.cedula}</td>
				<td>{dato.nombres}</td>
				<td>{dato.apellidos}</td>
				<td>{dato.telefono}</td>
				<td>{dato.correo}</td>
				<td>{dato.direccion}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/cliente">
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
