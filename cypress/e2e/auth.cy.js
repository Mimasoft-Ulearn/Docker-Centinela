// Ejemplo de test suite completo
describe('Alta servidor, inicio sesion', () => {
  beforeEach(() => {
    cy.loginToCodeigniter('luis.loyola.b@hotmail.com', 'Ll1234')
  })

  it('debería mantener la sesión activa entre páginas', () => {
    cy.visit('/home')
    // Verifica que estamos en el dashboard y no en login
    cy.url().should('include', '/home')
  })
})