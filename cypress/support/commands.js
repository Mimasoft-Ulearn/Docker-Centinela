// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })
Cypress.Commands.add('loginToCodeigniter', (username, password) => {
    cy.session([username, password], () => {
        cy.visit('/signin')

        // Primero obtenemos el token CSRF del formulario
        cy.document().then((doc) => {
            // Buscamos el input hidden que contiene el token CSRF
            const csrfInput = doc.querySelector('input[type="hidden"]:not([name="email"]):not([name="password"])')
            const csrfTokenName = csrfInput.getAttribute('name')
            const csrfTokenValue = csrfInput.value

            // Guardamos el nombre del token para uso futuro
            Cypress.env('csrfTokenName', csrfTokenName)

            // Ahora podemos interactuar con el formulario
            cy.get('#signin-form').within(() => {
                cy.get('input[name="email"]').type(username)
                cy.get('input[name="password"]').type(password)
                cy.root().submit()
            })
        })

        // Verificar inicio de sesión exitoso
        cy.url().should('not.include', '/signin')
    })
})

// Comando para obtener el token CSRF actual
Cypress.Commands.add('getCsrfToken', () => {
    return cy.document().then((doc) => {
        const csrfInput = doc.querySelector(`input[name="${Cypress.env('csrfTokenName')}"]`)
        return csrfInput ? csrfInput.value : null
    })
})

// Comando para realizar peticiones POST con CSRF
Cypress.Commands.add('postWithCsrf', (url, data = {}) => {
    return cy.getCsrfToken().then(token => {
        const csrfData = {
            [Cypress.env('csrfTokenName')]: token
        }

        return cy.request({
            method: 'POST',
            url: url,
            body: { ...data, ...csrfData },
            failOnStatusCode: false
        })
    })
})

// Configuración para interceptar y manejar redirecciones de sesión
Cypress.Commands.add('handleSessionTimeout', () => {
    cy.on('window:before:load', (win) => {
        cy.stub(win, 'open').as('windowOpen')
    })

    // Interceptar redirecciones al login
    cy.intercept('/signin').as('loginRedirect')
})