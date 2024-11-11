<script>
	import icono from '$lib/images/icono.png';
	import flecha from '$lib/images/flecha.png';
	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = '';
	let categories = [
		{ id: 'aliado/HomeAliado/empleado', name: 'Empleados' },
		{ id: 'aliado/HomeAliado/maquinaria', name: 'Maquinaria' },
		{ id: 'aliado/HomeAliado/mineral', name: 'Mineral' }
	];
</script>

<div class="ModuloAdministracion">
	<div class="ModuloAdministracionHeader">
		<div class="icono">
			<img src={icono} alt="persona" />
		</div>
		<div class="flecha">
			<img src={flecha} alt="flecha" />
		</div>
		<h2>Modulo de Aliado</h2>
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
			<div class="title">{opcionSeleccionada}</div>
			<div class="search-bar">
				<input
					class="search-input"
					type="text"
					placeholder="Escribe aquí..."
					bind:value={searchTerm}
				/>
				<button class="search-button" on:click={search}>Buscar</button>
			</div>
			<slot />
		</div>
	</div>
</div>

<style>
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

	.search-bar {
		display: flex;
		align-items: center;
		padding: 8px;
		background-color: #f3f3f3;
		border-radius: 8px;
		margin-bottom: 16px;
		width: 50%;
		margin-left: auto;
	}

	.search-input {
		flex-grow: 1;
		border: none;
		padding: 8px;
		margin-right: 8px;
	}

	.search-button {
		padding: 8px 16px;
		background-color: #050505;
		color: white;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}

	.title {
		font-size: 24px;
		color: #333;
		margin-bottom: 8px;
	}
</style>
