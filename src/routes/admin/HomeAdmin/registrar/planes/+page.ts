import type { PageLoad } from './$types';
export const load: PageLoad = async ({ url }:{url:URL}) => {
    const response = await fetch('/api/data');
    const data = await response.json();
    const parms= url.searchParams();

    return {
        props: {
            data
        }
    };
};