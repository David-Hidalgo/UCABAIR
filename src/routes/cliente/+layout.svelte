<script>
	import icono from '$lib/images/icono.png';
	import carrito from '$lib/images/carrito_icono.png';
	import logoUcabAir from '$lib/images/logo_ucabair.png';
	let buscar = '';
</script>

<header>
	<div class="Caja1">
		<div class="Usuario">
			<img src={icono} alt="Icono Ingresar" class="Icono-img" />
			<div class="IngresarCrearCuenta">
				<a href="/cliente/login">Ingresar</a>
				<a href="/cliente/registro">Crear Cuenta</a>
			</div>
		</div>
	</div>

	<div class="Caja2">
		<div class="logo">
			<img src={logoUcabAir} alt="AirUcab Logo" />
		</div>
		<div class="Buscar">
			<form action="/buscar" method="post" class="cajachica">
				<input
					bind:value={buscar}
					class="palabras"
					id="buscar"
					name="Buscar"
					type="text"
					placeholder="Buscar por producto, marca o presentacion"
				/>
				<button type="submit" class="ingresar">Buscar</button>
			</form>
		</div>
		<div class="carrito">
			<img src={carrito} alt="AirUcab Logo" />
			<a href="/cliente/carrito">Carrito de Compras</a>
		</div>
	</div>
</header>

<div class="Caja3">
	<div class="botonesCaja3">
		<a class="Home" href="/cliente">Home</a>
		<a class="Comprar" href="/cliente/productos">Comprar</a>
		<a class="AcercaDe" href="/cliente/Acercade">Acerca De</a>
	</div>
</div>
<div class="margenContenido">
	<slot />
</div>

<style>
	.margenContenido {
		margin: 0 170px 0 170px;
	}

	a.Home {
		border: none;
		color: white;
		padding: 14px 36px;
		text-align: center;
		text-decoration: none;
		font-size: 16px;
		margin: 0px -2px;
		transition-duration: 0.4s;
		cursor: pointer;
	}

	a.Comprar {
		border: none;
		color: white;
		padding: 14px 36px;
		text-align: center;
		text-decoration: none;
		font-size: 16px;
		margin: 0px -2px;
		transition-duration: 0.4s;
		cursor: pointer;
	}

	a.AcercaDe {
		border: none;
		color: white;
		padding: 14px 36px;
		text-align: center;
		text-decoration: none;
		font-size: 16px;
		margin: 0px -2px;
		transition-duration: 0.4s;
		cursor: pointer;
	}

	.Home {
		background-color: rgb(31, 30, 30);
		color: gainsboro;
	}

	.Home:hover {
		background-color: #dadada;
		color: rgb(75, 74, 74);
	}

	.Comprar {
		background-color: rgb(31, 30, 30);
		color: gainsboro;
	}

	.Comprar:hover {
		background-color: #dadada;
		color: rgb(75, 74, 74);
	}

	.AcercaDe {
		background-color: rgb(31, 30, 30);
		color: gainsboro;
	}

	.AcercaDe:hover {
		background-color: #dadada;
		color: rgb(75, 74, 74);
	}

	.botonesCaja3 {
		padding: 14px;
		margin: 0 0 0 170px;
		align-items: center;
	}

	.IngresarCrearCuenta {
		display: grid;
	}
	.palabras {
		border-radius: 5px;
		font-style: bold;
		border-color: gainsboro;
	}

	.Buscar {
		justify-content: center;
		display: flex;
	}

	.Ingresar {
		border-radius: 5px;
		font-style: bold;
		color: gainsboro;
		background-color: black;
	}

	header {
		position: static;
	}

	.Caja1 {
		border-bottom: solid gainsboro 2px;
		margin: 0 200px 0 170px;
	}

	.Caja2 {
		display: flex;
		justify-content: space-between;
		font-style: serif;
		align-items: center;
		margin: 0 170px 0 170px;
	}

	.Caja3 {
		background-color: rgb(31, 30, 30);
		width: 100%;
		height: 45px;
		font-style: bold;
	}

	.Usuario {
		font-size: 12px;
		justify-content: right;
		display: flex;
		align-items: center;
	}

	.Usuario img {
		height: 30px;
	}

	.carrito {
		font-size: 12px;
		justify-content: right;
		display: flex;
		align-items: center;
		color: black;
	}

	.carrito img {
		height: 30px;
	}

	.logo {
		display: flex;
	}

	.logo img {
		height: 50px;
	}

	.UsuarioIcono {
		position: flex;
	}
</style>
