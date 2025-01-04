<script lang="ts">
	import RegistroNat from '$lib/components/registrarClienteNat.svelte';
	import RegistroJur from '$lib/components/registrarClienteJur.svelte';
	let selectedComponent= RegistroNat;

    function seleccionarComponente(tipoCliente: string) {
        switch (tipoCliente) {
            case 'Natural':
                selectedComponent = RegistroNat;
                break;
            case 'Juridico':
                selectedComponent = RegistroJur;
                break;
            default:
                selectedComponent = RegistroNat;
        }
    }
</script>
		<div>
			<button on:click={() => seleccionarComponente('Natural')}>Persona Natural</button>
			<button on:click={() => seleccionarComponente('Juridico')}>Persona Jurídica</button>
		</div>
		
		{#if selectedComponent}
			<svelte:component this={selectedComponent}  codigo_com={null}, fk_usuario={null}/>
		{/if}

		<style>
			/* Estilos generales para el formulario */
			form {
				max-width: 100%;
				margin: 0 auto;
				padding: 20px;
				border: 1px solid #ccc;
				border-radius: 5px;
				background-color: #f9f9f9;
				display: flex;
				flex-direction: column;
			}
		
			/* Estilos para las etiquetas y campos de entrada */
			label {
				display: block;
				margin-bottom: 10px;
				font-weight: bold;
			}
		
			input {
				width: 40%;
				padding: 10px;
				margin-bottom: 15px;
				border: 1px solid #ccc;
				border-radius: 3px;
				font-size: 14px;
			}
		
			/* Estilos para el botón de envío */
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