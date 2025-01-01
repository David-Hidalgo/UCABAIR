<script>
	import icono from '$lib/images/icono.png';
	import carrito from '$lib/images/avion_logo.png';
	import logoUcabAir from '$lib/images/logo_ucabair.png';
	let buscar = '';
</script>

<header>
	<div class="Caja2">
		<div class="logo">
			<img src={logoUcabAir} alt="AirUcab Logo" />
		</div>
		<div class="carrito">
			<img src={carrito} alt="AirUcab Logo" />
			<a href="/cliente/carrito">Carrito de Compras</a>
		</div>
	</div>
</header>

<div class="Caja3">
	<div class="botonesCaja3">
		<a class="Home" href="/cliente/Home">Home</a>
		<a class="Comprar" href="/cliente/productos">Comprar</a>
		<a class="Perfil" href="/cliente/perfil">Perfil</a>
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

	a.Perfil {
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

	.Perfil {
		background-color: rgb(31, 30, 30);
		color: gainsboro;
	}

	.Perfil:hover {
		background-color: #dadada;
		color: rgb(75, 74, 74);
	}

	.botonesCaja3 {
		padding: 14px;
		margin: 0 0 0 170px;
		align-items: center;
	}

	header {
		position: static;
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
