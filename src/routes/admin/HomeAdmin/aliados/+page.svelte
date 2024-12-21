<script lang="ts">
	
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
	import type { Proveedor } from './+page.server.ts';
	import { goto } from '$app/navigation';
	let { data }: { data: PageData } = $props();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}

	let proveedores: Proveedor[] = new Array();
	for (let index = 0; index < data.roltable.length; index++) {
		let proveedor: Proveedor = {
			codigo_com:undefined,
	rif_jur: '',
	denominacion_persona_jur: '',
	razon_social_jur: '',
	pagina_web_jur: '',
	//telefono_com: undefined,
	//correo_com: '',
	direccion_com: '',
	monto_acreditado_com:undefined,
	fecha_inicio_operaciones_com:undefined
		};
		proveedor.codigo_com = data.roltable[index].codigo_com;
		proveedor.rif_jur = data.roltable[index].rif_jur;
		proveedor.denominacion_persona_jur = data.roltable[index].denominacion_persona_jur;
        proveedor.razon_social_jur = data.roltable[index].razon_social_jur;
        proveedor.pagina_web_jur = data.roltable[index].pagina_web_jur;
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
		await fetch(`http://localhost:5173/admin/HomeAdmin/aliado`, {
			method: 'DELETE',

			body: JSON.stringify(proveedor.codigo_com)
			
		});
		// goto('/admin/HomeAdmin/aliado')
	}
</script>

<h2>Proveedores</h2>
<table>
	<thead>
		<tr>
			<th>RIF</th>
			<th>Denominacion comercial</th>
            <th>Razon social</th>
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
				<td>{proveedor.rif_jur}</td>
				<td>{proveedor.denominacion_persona_jur}</td>
                <td>{proveedor.razon_social_jur}</td>
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
