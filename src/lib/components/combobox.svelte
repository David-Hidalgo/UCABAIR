<script>
    let sedes = ["Todas Las Sedes",
        "Sede Maracaibo",
        "Sede Valencia",
        "Sede Catia La Mar",
        "Sede Bolívar",
        "Sede Caracas",
        "Sede Barquisimeto",
        "Sede Mérida"
    ];
</script>

<select>
    <option value="">Seleccione una sede</option>
    {#each sedes as sede}
        <option value="{sede}">{sede}</option>
    {/each}
</select>
