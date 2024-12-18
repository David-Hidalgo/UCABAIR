import type { Actions, PageServerLoad } from './$types';
import { fail, redirect } from '@sveltejs/kit';
export const actions: Actions = {
    descargar: async (event) => {
        console.log(" entré");
        
    const report = await fetch('http://localhost:8081/jasperserver/rest_v2/reports/Prueba', {
			method: 'GET',
			headers: {
				Authorization: `Basic ${btoa('jasperadmin:jasperadmin')}`,
				// 'Content-Type': 'application/json'
			}
		});
        console.log(report);
        
        return report;
    }
}