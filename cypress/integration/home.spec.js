

describe('jungle-app', () => {
  it('Should visit the home page', () => {
    cy.visit('http://localhost:3000')
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

})

