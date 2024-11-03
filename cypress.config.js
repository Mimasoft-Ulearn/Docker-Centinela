const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    baseUrl: 'http://localhost:80', // Ajusta esto a la URL base de tu aplicación CodeIgniter
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    chromeWebSecurity: false, // Útil si tienes problemas con CORS o iframes
    defaultCommandTimeout: 10000, // Tiempo de espera predeterminado en millisegundos
    viewportWidth: 1280, // Ancho de ventana predeterminado
    viewportHeight: 720, // Alto de ventana predeterminado
    // Para manejar errores de redirección de CodeIgniter
    redirectionLimit: 20,
    // Patrones de archivo para tus pruebas
    specPattern: 'cypress/e2e/**/*.cy.{js,jsx,ts,tsx}',
    // Variables de entorno que podrías necesitar
    env: {
      login_url: '/signin', // Ajusta según tu ruta de login
      // Puedes agregar más variables según necesites
      codeigniter_csrf_token: 'csrf_test_name' // Nombre de tu token CSRF si lo usas
    }
  },
});
