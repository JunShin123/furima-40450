  const item_price = () => {
  const priceInput = document.getElementById("item-price");
  const feeDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value);
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    feeDisplay.innerHTML = tax.toLocaleString();
    profitDisplay.innerHTML = profit.toLocaleString();
  })
};

window.addEventListener('turbo:load', item_price);
window.addEventListener('turbo:render', item_price);