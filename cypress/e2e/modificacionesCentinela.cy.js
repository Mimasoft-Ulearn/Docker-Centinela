describe('Modificaciones al left menu y pruebas de rutas', () => {
    // antes del test iniciar sesion para acceder a las rutas protegidas.
    beforeEach(() => {
        cy.loginToCodeigniter('luis.loyola.b@hotmail.com', 'Ll1234')
    })

    // comprobamos que el redirect funciona
    it('debería redirigir correctamente desde view/1', () => {
        // Interceptar la redirección
        cy.intercept('GET', '/air_monitoring_charts').as('chartRedirect')

        // Visitar la ruta original
        cy.visit('/dashboard/view/1')

        // Verificar que la redirección ocurrió
        cy.url().should('include', '/air_monitoring_charts')

        // Verificar que estamos en la página correcta
        cy.get('h1').should('contain','Gráficos')
    })

    // comprobamos que las modificaciones al sidebar estan ok
    // Test para verificar el estilo y la visibilidad
    it('debería tener el estilo y la visibilidad correcta', () => {
        cy.visit('/air_monitoring_charts')
        cy.get('#sidebar-menu')
            .find('li.main.active ul li')
            .contains('span', 'Camaras')
            .should('be.visible')
            .and('have.css', 'display', 'inline-block') // Ajusta según tus estilos
            .parent('a') // Verificar el enlace padre
            .should('have.attr', 'href') // Verificar que tiene un href
    })


})