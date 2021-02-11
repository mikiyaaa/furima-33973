window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  const tax = 0.1
  
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    addTaxPrice.innerHTML = Math.floor(inputValue * tax)

    profit.innerHTML = inputValue - addTaxPrice.innerHTML
  });
});