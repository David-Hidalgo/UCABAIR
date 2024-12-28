<script>
	let accountData = {
	  name: "Pepito Fulano Perez Gonzales",
	  email: "pepfupez@correoalohave",
	  id: "V-12345678",
	  address: "Avenida Teherán, Caracas 1030, Distrito Capital",
	  phone1: "0414-1234567",
	  phone2: "0212-1234567"
	};
  
	let shippingData = {
	  ...accountData,
	  postalCode: "1030"
	};
  </script>
  
  <style>
	.container {
	  font-family: Arial, sans-serif;
	  margin: 20px;
	}
	.section {
	  margin-bottom: 20px;
	}
	.section-header {
	  font-weight: bold;
	  margin-bottom: 10px;
	}
	.field {
	  margin-bottom: 5px;
	}
	.edit-icon {
	  float: right;
	  cursor: pointer;
	}
  </style>
  
  <div class="container">
	<div class="section">
	  <div class="section-header">
		Datos de la cuenta
		<span class="edit-icon">✏️</span>
	  </div>
	  <div class="field">Nombres y apellidos: {accountData.name}</div>
	  <div class="field">Correo electrónico: {accountData.email}</div>
	  <div class="field">Cédula de Identidad: {accountData.id}</div>
	  <div class="field">Dirección: {accountData.address}</div>
	  <div class="field">Teléfonos personales: {accountData.phone1}, {accountData.phone2}</div>
	</div>
  
	<div class="section">
	  <div class="section-header">
		Datos de envío
		<span class="edit-icon">✏️</span>
	  </div>
	  <div class="field">Nombres y apellidos: {shippingData.name}</div>
	  <div class="field">Correo electrónico: {shippingData.email}</div>
	  <div class="field">Cédula de Identidad: {shippingData.id}</div>
	  <div class="field">Dirección de envío: {shippingData.address}</div>
	  <div class="field">Teléfonos personales: {shippingData.phone1}, {shippingData.phone2}</div>
	  <div class="field">Código Postal: {shippingData.postalCode}</div>
	</div>
  </div>
  