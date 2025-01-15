// place files you want to import through the `$lib` alias in this folder.
export const regExpEmail = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i; // Email validation
export const regExpPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/; // Minimum eight characters, at least one uppercase letter, one lowercase letter and one number