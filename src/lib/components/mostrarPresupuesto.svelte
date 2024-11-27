<script lang="ts">
    interface Presupuesto {
        pieza: string;
        subtrabajo: string;
        costo: number;
    }

    interface MateriaPrima {
        pieza: string;
        material: string;
        cantidad: number;
        costo: number;
    }

    interface Costo {
        personal_encargado: string;
        personal_requerido: string;
        trabajo: string;
        costo: number;
    }

    interface Empresa {
        nombre: string;
        rif: string;
        direccion: string;
        correo: string;
        telefono: string;
    }

    interface Ensamblaje {
        modelo: string;
        fecha_inicio: string;
        fecha_fin: string;
    }

    let presupuestos: Presupuesto[] = [
        {
            pieza: 'Alas',
            subtrabajo: 'Ensamblaje de alas',
            costo: 1000000
        },
        {
            pieza: 'Fuselaje',
            subtrabajo: 'Ensamblaje de fuselaje',
            costo: 1000000
        },
        {
            pieza: 'Tren de aterrizaje',
            subtrabajo: 'Ensamblaje de tren de aterrizaje',
            costo: 1000000
        },
        {
            pieza: 'Motores',
            subtrabajo: 'Ensamblaje de motores',
            costo: 1000000
        }
    ];

    let materias_primas: MateriaPrima[] = [
        {
            pieza: 'Alas',
            material: 'Aluminio',
            cantidad: 1000,
            costo: 1000000
        },
        {
            pieza: 'Fuselaje',
            material: 'Aluminio',
            cantidad: 1000,
            costo: 1000000
        },
        {
            pieza: 'Tren de aterrizaje',
            material: 'Acero',
            cantidad: 1000,
            costo: 1000000
        },
        {
            pieza: 'Motores',
            material: 'Acero',
            cantidad: 1000,
            costo: 1000000
        }
    ];


    let costos: Costo[] = [
        {
            personal_encargado: 'Juan Pérez',
            personal_requerido: '5',
            trabajo: 'Ensamblaje de alas',
            costo: 1000000
        },
        {
            personal_encargado: 'María González',
            personal_requerido: '3',
            trabajo: 'Ensamblaje de fuselaje',
            costo: 1000000
        },
        {
            personal_encargado: 'Carlos Martínez',
            personal_requerido: '2',
            trabajo: 'Ensamblaje de tren de aterrizaje',
            costo: 1000000
        },
        {
            personal_encargado: 'José Rodríguez',
            personal_requerido: '4',
            trabajo: 'Ensamblaje de motores',
            costo: 1000000
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
        modelo: 'Airbus A320',
        fecha_inicio: '2021-01-01',
        fecha_fin: '2021-01-31'
    };

</script>
<div class="presupuesto">
    <h1>Presupuesto de ensamblaje de {ensamblaje.modelo}</h1>

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
                    <td>{costo.personal_requerido}</td>
                    <td>{costo.trabajo}</td>
                    <td>{costo.costo}</td>
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
                    <td>{presupuesto.subtrabajo}</td>
                    <td>{presupuesto.costo}</td>
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
                    <td>{materia_prima.material}</td>
                    <td>{materia_prima.cantidad}</td>
                    <td>{materia_prima.costo}</td>
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