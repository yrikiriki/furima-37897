window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price");
    const taxValue = Math.floor(inputValue * 0.1);
    addTax.innerHTML  = taxValue
  const profit = document.getElementById("profit");
  profit.innerHTML = Math.floor(inputValue - taxValue);
  });
})