<script>
	import foto from '$lib/images/logo_ucabair.png';
	// biome-ignore lint/correctness/noUnusedVariables: <explanation>
	let buscar = '';
</script>

<header>
	<div class="CajaEncabezadoAdmin">
		<div class="Caja2">
			<div class="logo">
				<img src={foto} alt="UCABAir Logo" />
			</div>
			<div class="Admin"></div>
		</div>
	</div>
</header>

<div class="Caja3"></div>
<div class="margenContenido">
	<slot />
</div>

<style>
	.margenContenido {
		margin: 0 170px 0 170px;
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

	.logo {
		display: flex;
	}

	.logo img {
		height: 50px;
	}
</style>
