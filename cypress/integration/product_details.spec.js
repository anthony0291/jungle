describe('product-details', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('/')
  })

  it("Visit product details page", () => {
    // Click on giant tea image
    cy.get('[alt="Giant Tea"]').click();
    // Check if we have an h1 that contains the text Giant Tea
    cy.get('.product-detail h1').last().should('have.text', 'Giant Tea');
  });
});