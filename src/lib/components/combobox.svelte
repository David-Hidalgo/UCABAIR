<script>
	/**
	 * @type {any[]}
	 */
	export let options = []; // Opciones del combobox
</script>

<select>
	{#each options as option}
		<option value={option.value}>{option.text}</option>
	{/each}
</select>
