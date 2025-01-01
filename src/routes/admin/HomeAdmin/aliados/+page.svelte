<script lang="ts">
	
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
	import type { Proveedor, Telefono, Correo_electronico } from './+page.server.ts';
	import { goto } from '$app/navigation';
	let { data }: { data: PageData } = $props();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let telefonos: Telefono[] = new Array();
for (let index = 0; index < data.tel_table.length; index++) {
    let telefono: Telefono = {
        codigo_tel: undefined,
	    numero_telefono_tel: '',
	    codigo_area_tel: '',
	    fk_persona: undefined,
	    fk_empleado: undefined
    }
    telefono.codigo_tel = data.tel_table[index].codigo_tel;
    telefono.numero_telefono_tel = data.tel_table[index].numero_telefono_tel;
    telefono.codigo_area_tel = data.tel_table[index].codigo_area_tel;
    telefono.fk_persona = data.tel_table[index].fk_persona;
    if (telefono.fk_persona === undefined) {
            telefono.numero_telefono_tel = 'No hay telefonos asociados';
        }
    telefono.fk_empleado = data.tel_table[index].fk_empleado;
    telefonos.push(telefono);
};


let correos: Correo_electronico[] = new Array();
for (let index = 0; index < data.email_table.length; index++) {
    let correo: Correo_electronico = {
        codigo_ce: undefined,
        direccion_correo_ce: '',
        fk_persona: undefined,
        fk_empleado: undefined
    }
    correo.codigo_ce = data.email_table[index].codigo_ce;
    correo.direccion_correo_ce = data.email_table[index].direccion_correo_ce;
    correo.fk_persona = data.email_table[index].fk_persona;
        if (correo.fk_persona === undefined) {
            correo.direccion_correo_ce = 'No hay correos asociados';
        }
    correo.fk_empleado = data.email_table[index].fk_empleado;
    correos.push(correo);
};

	let proveedores: Proveedor[] = new Array();
	for (let index = 0; index < data.roltable.length; index++) {
		let proveedor: Proveedor = {
			codigo_com:undefined,
			rif_jur: '',
			denominacion_persona_jur: '',
			razon_social_jur: '',
			pagina_web_jur: '',
			telefono_com: [],
			correo_com: [],
			direccion_com: '',
			monto_acreditado_com:undefined,
			fecha_inicio_operaciones_com: 'hola'
		};
		proveedor.codigo_com = data.roltable[index].codigo_com;
		proveedor.rif_jur = data.roltable[index].rif_jur;
		proveedor.denominacion_persona_jur = data.roltable[index].denominacion_persona_jur;
        proveedor.razon_social_jur = data.roltable[index].razon_social_jur;
        proveedor.pagina_web_jur = data.roltable[index].pagina_web_jur;
		proveedor.telefono_com = telefonos.filter(telefono => telefono.fk_persona === proveedor.codigo_com);
		proveedor.correo_com = correos.filter(correo => correo.fk_persona === proveedor.codigo_com);
        proveedor.direccion_com = data.roltable[index].direccion_com;
        proveedor.monto_acreditado_com = data.roltable[index].monto_acreditado_com;
        proveedor.fecha_inicio_operaciones_com = data.roltable[index].fecha_inicio_operaciones_com;
		proveedores.push(proveedor);
	};

    async function editarRegistro(proveedores: Proveedor) {
		/*try {
			const res = await fetch(`http://localhost:4000/mineral/${roles.id}`, {
				method: 'PUT',
				body: JSON.stringify(roles),
				headers: { 'Content-Type': 'application/json' }
			});

			if (res.ok) {
				// Si la solicitud fue exitosa, redirige al usuario
			} else {
				console.error('Error al actualizar el mineral:', res.status);
				// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
			}
		} catch (error) {
			console.error('Error en la solicitud:', error);
			// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
		}*/
	}

	async function eliminarRegistro(proveedor: Proveedor) {
		await fetch(`http://localhost:5173/admin/HomeAdmin/aliados`, {
			method: 'DELETE',

			body: JSON.stringify(proveedor.codigo_com)
			
		});
		location.reload();
	}
</script>

<h2>Proveedores</h2>
<table>
	<thead>
		<tr>
			<th>Codigo</th>
			<th>RIF</th>
			<th>Denominacion comercial</th>
            <th>Razon social</th>
			<th>Telefono</th>
			<th>Correo</th>
            <th>Pagina web</th>
            <th>Direccion</th>
            <th>Monto acreditado</th>
            <th>Fecha inicio operaciones</th>
			<th>Estado</th>
			<th>Usuario</th>
		</tr>
	</thead>
	<tbody>
		{#each proveedores as proveedor}
			<tr>
				<td>{proveedor.codigo_com}</td>
				<td>{proveedor.rif_jur}</td>
				<td>{proveedor.denominacion_persona_jur}</td>
                <td>{proveedor.razon_social_jur}</td>
				<td>{proveedor.telefono_com.map(tel => tel.numero_telefono_tel).join(', ')}</td>
				<td>{proveedor.correo_com.map(correo => correo.direccion_correo_ce).join(', ')}</td>
                <td>{proveedor.pagina_web_jur}</td>
                <td>{proveedor.direccion_com}</td>
                <td>{proveedor.monto_acreditado_com}</td>
                <td>{proveedor.fecha_inicio_operaciones_com}</td>
				<td>
					<div class="botonesUD">
						<a href='/admin/HomeAdmin/editar/aliado/{proveedor.codigo_com}'>
							<button onclick={() => editarRegistro(proveedor)}>
								<span>✏️</span>
								<!-- Icono de lápiz -->
							</button>
						</a>
						<button onclick={() => eliminarRegistro(proveedor)}>
							<span>🗑️</span>
							<!-- Icono de papelera -->
						</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/aliado">
	<button>Registrar Proveedor</button>
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
