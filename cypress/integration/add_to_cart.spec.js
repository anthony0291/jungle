describe('add-to-cart', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("Should add item to card and confirm it exists", () => {
    cy.get('.navbar').find(".end-0").contains('0');
    cy.get('.products article').first().find("button").click();
    cy.get('.navbar').find(".end-0").contains('1');
  });
})