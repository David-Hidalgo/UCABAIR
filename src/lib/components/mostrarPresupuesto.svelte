<script lang="ts">
    export let id_editar: number;

    interface Presupuesto {
        pieza: string;
        subtrabajo: { nombre: string; costo: number}[];
    }

    interface MateriaPrimaxPieza {
        pieza: string;
        materiales: { nombre: string; costo: number; cantidad: number }[];
    }

    interface Costo_Personal {

        personal_encargado: string;
        empleados: number;
        subtrabajo:{nombre: string; costo: number }[];
    }

    interface Empresa {
        nombre: string;
        rif: string;
        direccion: string;
        correo: string;
        telefono: string;
    }

    interface Ensamblaje {
        id_modelo: number;
        modelo: string;
        fecha_inicio: string;
        fecha_fin: string;
    }


    let presupuestos: Presupuesto[] = [
        {
            pieza: 'Alas',
            subtrabajo: [{ nombre: 'Corte de aluminio', costo: 100000 },
                        { nombre: 'Doblado de aluminio', costo: 100000 },
                        { nombre: 'Ensamblaje de alas', costo: 100000 }],
        },
        {
            pieza: 'Fuselaje',
            subtrabajo: [
                { nombre: 'Corte de aluminio', costo: 100000 },
                { nombre: 'Doblado de aluminio', costo: 100000 },
                { nombre: 'Ensamblaje de fuselaje', costo: 100000 }
            ]
        },
        {
            pieza: 'Tren de aterrizaje',
            subtrabajo: [
                { nombre: 'Corte de acero', costo: 100000 },
                { nombre: 'Doblado de acero', costo: 100000 },
                { nombre: 'Ensamblaje de tren de aterrizaje', costo: 100000 }
            ]
        },
        {
            pieza: 'Motores',
            subtrabajo: [
                { nombre: 'Corte de acero', costo: 100000 },
                { nombre: 'Doblado de acero', costo: 100000 },
                { nombre: 'Ensamblaje de motores', costo: 100000 }
            ]
        }
    ];

    let materias_primas: MateriaPrimaxPieza[] = [
        {
            pieza: 'Alas',
            materiales: [
                { nombre: 'Aluminio', costo: 100000, cantidad: 100 },
                { nombre: 'Remaches', costo: 100000, cantidad: 100 }
            ]
        },
        {
            pieza: 'Fuselaje',
            materiales: [
                { nombre: 'Aluminio', costo: 100000, cantidad: 100 },
                { nombre: 'Remaches', costo: 100000, cantidad: 100 }
            ]
        },
        {
            pieza: 'Tren de aterrizaje',
            materiales: [
                { nombre: 'Acero', costo: 100000, cantidad: 100 },
                { nombre: 'Remaches', costo: 100000, cantidad: 100 }
            ]
        },
        {
            pieza: 'Motores',
            materiales: [
                { nombre: 'Acero', costo: 100000, cantidad: 100 },
                { nombre: 'Remaches', costo: 100000, cantidad: 100 }
            ]
        }
    ];


    let costos: Costo_Personal[] = [
        {
            personal_encargado: 'Ingeniero de ensamblaje',
            empleados: 1,
            subtrabajo: [
            { nombre: 'Ensamblaje de piezas', costo: 100000 },
            { nombre: 'Revisión de ensamblaje', costo: 50000 }]
        },
        {
            personal_encargado: 'Ingeniero de calidad',
            empleados: 1,
            subtrabajo: [
            { nombre: 'Control de calidad', costo: 100000 },
            { nombre: 'Pruebas de calidad', costo: 75000 }]
        },
        {
            personal_encargado: 'Técnico de mantenimiento',
            empleados: 1,
            subtrabajo: [
            { nombre: 'Mantenimiento de piezas', costo: 100000 },
            { nombre: 'Reparación de piezas', costo: 60000 }]
        },
        {
            personal_encargado: 'Supervisor de producción',
            empleados: 1,
            subtrabajo: [
            { nombre: 'Supervisión de línea de producción', costo: 120000 },
            { nombre: 'Coordinación de equipos', costo: 80000 }]
        },
        {
            personal_encargado: 'Operador de maquinaria',
            empleados: 2,
            subtrabajo: [
            { nombre: 'Operación de maquinaria', costo: 90000 },
            { nombre: 'Mantenimiento de maquinaria', costo: 70000 }]
        }
    ];

    let empresa: Empresa = {
        nombre: 'AeroVenezuela',
        rif: 'J-12345678-9',
        direccion: 'Calle Falsa 123',
        correo: 'ucabair@hotmail.com',
        telefono: '+58-212-1234567'
    };

    let ensamblaje: Ensamblaje = {
        id_modelo: id_editar,
        modelo: 'Airbus A320',
        fecha_inicio: '2021-01-01',
        fecha_fin: '2021-01-31'
    };


</script>
<div class="presupuesto">
    <h1>Presupuesto de ensamblaje de {ensamblaje.modelo} con ID: {ensamblaje.id_modelo}</h1>

    <h2>Datos de la empresa</h2>
    <p>Nombre: {empresa.nombre}</p>
    <p>RIF: {empresa.rif}</p>
    <p>Dirección: {empresa.direccion}</p>
    <p>Correo: {empresa.correo}</p>
    <p>Teléfono: {empresa.telefono}</p>

    <h2>Detalles del ensamblaje</h2>
    <p>Modelo: {ensamblaje.modelo}</p>
    <p>Fecha estimada de inicio: {ensamblaje.fecha_inicio}</p>
    <p>Fecha estimada Fin: {ensamblaje.fecha_fin}</p>

    <h1>Desglose de Costos</h1>
    <h2>Costos de Personal</h2>
    <table>
        <thead>
            <tr>
                <th>Personal Encargado</th>
                <th>Personal Requerido</th>
                <th>Trabajo a Realizar</th>
                <th>Costo Total</th>
            </tr>
        </thead>
        <tbody>
            {#each costos as costo}
                <tr>
                    <td>{costo.personal_encargado}</td>
                    <td>{costo.empleados}</td>
                    <td>{#each costo.subtrabajo as subtrabajo}
                        <tr>
                            <td>{subtrabajo.nombre}</td>
                            <td>{subtrabajo.costo}</td>
                        </tr>
                        {/each}
                    </td>
                    <td>{costo.subtrabajo.reduce((acc, curr) => acc + curr.costo, 0)}</td>
                </tr>
            {/each}
        </tbody>
    </table>
    <h2>Costos de elaboracion de piezas y ensamblaje</h2>
    <table>
        <thead>
            <tr>
                <th>A Ensamblar</th>
                <th>Trabajos</th>
                <th>Costo</th>
            </tr>
        </thead>
        <tbody>
            {#each presupuestos as presupuesto, i}
                <tr>
                    <td>{presupuesto.pieza}</td>
                    <td>{#each presupuesto.subtrabajo as subtrabajo, i}
                        <tr>
                            <td>{subtrabajo.nombre}</td>
                            <td>{subtrabajo.costo}</td>
                        </tr>
                        {/each}
                    </td>
                    <td>{presupuesto.subtrabajo.reduce((acc, curr) => acc + curr.costo, 0)}</td>
                </tr>
            {/each}
        </tbody>
    </table>
    <h2>Costos de materia prima</h2>
    <table>
        <thead>
            <tr>
                <th>A Ensamblar</th>
                <th>Material Necesario</th>
                <th>Cantidad</th>
                <th>Costo</th>
            </tr>
        </thead>
        <tbody>
            {#each materias_primas as materia_prima, i}
                <tr>
                    <td>{materia_prima.pieza}</td>
                    <td>{#each materia_prima.materiales as material, i}
                        <tr>
                            <td>{material.nombre}</td>
                            <td>{material.cantidad}</td>
                            <td>{material.costo}</td>
                        </tr>
                        {/each}
                    </td>
                    <td>{materia_prima.materiales.reduce((acc, curr) => acc + curr.costo, 0)}</td>
                </tr>
            {/each}
        </tbody>
    </table>
</div>
<style>
	.presupuesto {
        padding-left: 20px;
        border: 1px solid black;
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
		text-align: left;
		letter-spacing: -0.03em;
	}
	thead {
		background-color: white;
	}

    h2 {
        text-decoration: underline;
    }

    h1 {
        text-decoration: underline;
        text-align: center;
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