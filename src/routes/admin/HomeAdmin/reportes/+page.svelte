<script lang="ts">
    
	import type { ActionData } from './$types';
    

    async function Descargar() {
        
        window.location.href = 'http://localhost:8081/jasperserver/flow.html?_flowId=viewReportFlow&_flowId=viewReportFlow&ParentFolderUri=%2Freports&reportUnit=%2Freports%2FPrueba&standAlone=true';
        
        
    }
</script>


    <button id="downloadButton" onclick={Descargar}>Ir al Reporte Prueba</button>

