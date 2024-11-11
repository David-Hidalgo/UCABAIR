<script lang="ts">
	import empleado from '$lib/components/registrarEmpleado.svelte';
	import maquinaria from '$lib/components/registrarMaquinaria.svelte';

	let searchTerm = '';

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

	interface Maquinaria {
		tipo_maquinaria: string;
		nombre: string;
		placa_identificacion: string;
		marca: string;
		modelo: string;
		estado: string[];
		fecha_adquisicion: Date;
		ubicacion: string;
		valor: string;
		comentario: string;
	}

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let maquinarias: Maquinaria[] = [
		{
			tipo_maquinaria: 'Excavadora',
			nombre: 'CAT 320D',
			placa_identificacion: 'ABC123',
			marca: 'Caterpillar',
			modelo: '320D',
			estado: ['Operativa'],
			fecha_adquisicion: new Date('2022-05-15'),
			ubicacion: 'Obra de construcción',
			valor: 'USD 150,000',
			comentario: 'Buena condición general'
		},
		{
			tipo_maquinaria: 'Grúa',
			nombre: 'Liebherr LTM 1200-5.1',
			placa_identificacion: 'XYZ789',
			marca: 'Liebherr',
			modelo: 'LTM 1200-5.1',
			estado: ['En mantenimiento'],
			fecha_adquisicion: new Date('2021-10-01'),
			ubicacion: 'Depósito',
			valor: 'EUR 800,000',
			comentario: 'Necesita reparaciones'
		}
		// Agrega más registros según tus necesidades
	];

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

	const fecha = new Date();
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let min = 0;
	let max = 100000;

	function getRandomNumber(min: number, max: number) {
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}

	let numeroAleatorio = getRandomNumber(1, 100);
</script>

<h2>Recursos</h2>
<div class="tablas">
	<table>
		<thead>
			<h2>Empleados</h2>
			<tr>
				<th>Nombre Empleado</th>
				<th>Area De Trabajo</th>
				<th>Sueldo</th>
			</tr>
		</thead>
		<tbody>
			{#each empleados as empleado, i}
				<tr>
					<td>{(empleado.nombres, empleado.apellidos)}</td>
					<td>{empleado.area_trabajo}</td>
					<td>{empleado.sueldo}</td>
				</tr>
			{/each}
		</tbody>
	</table>
	<table>
		<thead>
			<h2>Maquinaria</h2>
			<tr>
				<th>Tipo Maquinaria</th>
				<th>Marca</th>
				<th>Valor</th>
			</tr>
		</thead>
		<tbody>
			{#each maquinarias as maquinaria, i}
				<tr>
					<td>{maquinaria.tipo_maquinaria}</td>
					<td>{maquinaria.marca}</td>
					<td>{maquinaria.valor}</td>
				</tr>
			{/each}
		</tbody>
	</table>
</div>

<style>
	.tablas {
		display: flex;
		justify-content: space-between;
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
