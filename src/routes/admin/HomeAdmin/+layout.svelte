<script>
	import icono from '$lib/images/icono.png';
	import flecha from '$lib/images/flecha.png';

	let categories = [
		{ id: 'admin/HomeAdmin/clientes', name: 'Clientes' },
		{ id: 'admin/HomeAdmin/empleado', name: 'Empleados' },
		{ id: 'admin/HomeAdmin/ensamblajes', name: 'Ensamblajes' },
		{ id: 'admin/HomeAdmin/inventario', name: 'Inventario' },
		{ id: 'admin/HomeAdmin/aliados', name: 'Proveedores' },
		{ id: 'admin/HomeAdmin/pruebas', name: 'Pruebas' },
		{ id: 'admin/HomeAdmin/roles', name: 'Roles' },
		{ id: 'admin/HomeAdmin/reportes', name: 'Reportes' },
		{ id: 'admin/HomeAdmin/solicitudes', name: 'Solicitudes' }
	];
</script>

<div class="ModuloAdministracion">
	<div class="ModuloAdministracionHeader">
		<div class="icono">
			<img src={icono} alt="minerucab Logo" />
		</div>
		<div class="flecha">
			<img src={flecha} alt="flecha" />
		</div>
		<h2>Modulo de Administración</h2>
	</div>
	<div class="CategoriasyContenido">
		<div class="categorias">
			<h2>Administrar</h2>
			<nav>
				<ul>
					{#each categories as category}
						<li><a href={`/${category.id}`}>{category.name}</a></li>
					{/each}
				</ul>
			</nav>
		</div>
		<div class="Contenido">
			<slot />
		</div>
	</div>
	<button type="button" onclick={() => window.history.back()}>Volver</button>
</div>

<style>
	button {
		background-color: #050505;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 16px;
	}

	.Contenido {
		border-color: 10px solid black;
		margin-top: 70px;
		width: 100%;
	}

	.CategoriasyContenido {
		display: flex;
		flex-direction: row;
		width: 100%;
	}

	.ModuloAdministracion {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.icono {
		display: flex;
		width: 42px;
		height: 42px;
		margin-right: 25px;
	}

	.flecha {
		display: flex;
		height: 20px;
		margin-right: 25px;
	}

	.ModuloAdministracionHeader {
		display: flex;
		position: absolute;
		width: 400px;
		height: 46px;
		margin-top: 35px;
		align-items: center;
		margin-right: 300px;
	}

	.categorias {
		left: 0;
		bottom: 0;
		margin-top: 80px;
	}
	nav ul {
		list-style: none;
		padding: 0;
	}

	nav li {
		padding: 0.5rem 0;
		border-bottom: 1px solid #ccc;
	}

	nav li:last-child {
		border-bottom: none;
	}

	nav a {
		text-decoration: none;
		color: #333;
	}
</style>
