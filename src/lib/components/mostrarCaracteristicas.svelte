<script lang="ts">
    export let id_editar: number | undefined;


</script>
<div class="caracteristicas">
    <p>Caracteristicas de modelo {id_editar}</p>
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