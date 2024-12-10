<h2>Seleccione las pruebas que desea mostrar:</h2>
<a href="/admin/HomeAdmin/pruebas/piezas">
	<button>Piezas</button>
</a>
<a href="/admin/HomeAdmin/pruebas/materia_prima">
	<button>Materia Prima</button>
</a>
<a href="/admin/HomeAdmin/pruebas/aeronaves">
	<button>Aeronaves</button>
</a>
<a href="/admin/HomeAdmin/pruebas/pruebas_catalogo">
	<button>Catalogo de Pruebas</button>
</a>
<slot/>


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
