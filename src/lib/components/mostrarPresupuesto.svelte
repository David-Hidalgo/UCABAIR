<script lang="ts">
    import type { Modelo_avion, Tipo_pieza,Tipo_prueba,Estimacion_profesion_empleado,Empleado_profesion,
                Configuracion_avion, Configuracion_prueba_avion,Profesion, Configuracion_def } from '$lib/server/db/schema';
    let modelos_avion: Modelo_avion[] = new Array();
    for (let index = 0; index < data.ma_table.length; index++) {
		let modelo_avion:  Modelo_avion = {
			codigo_ma: 0,
            nombre_ma: '',
            descripcion_ma: '',
            precio_unidad_ma: 0,
            fk_modelo_avion: 0
		};
        modelo_avion.codigo_ma = data.ma_table[index].codigo_ma;
        modelo_avion.nombre_ma = data.ma_table[index].nombre_ma;
        modelo_avion.descripcion_ma = data.ma_table[index].descripcion_ma;
        modelo_avion.precio_unidad_ma = data.ma_table[index].precio_unidad_ma;
        modelo_avion.fk_modelo_avion = data.ma_table[index].fk_modelo_avion;
        modelos_avion.push(modelo_avion);
	};


    export let tipo_pieza: Tipo_pieza[];
    export let tipo_prueba: Tipo_prueba[];
    export let estimacion_profesion_empleado: Estimacion_profesion_empleado[];
    export let empleado_profesion: Empleado_profesion[];
    export let configuracion_avion: Configuracion_avion[];
    export let configuracion_prueba_avion: Configuracion_prueba_avion[];
    export let profesion: Profesion[];
    export let tipo_p: Tipo_pieza[];


        
</script>
<div class="presupuesto">
    <h1>Presupuesto de ensamblaje de {modelo_avion.nombre_ma}</h1>

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