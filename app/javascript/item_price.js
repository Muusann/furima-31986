function item_price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const Tax = priceInput.value;
  num1 = Math.floor(Number(Tax)*0.1);
  const AddTax = document.getElementById("add-tax-price");
  AddTax.innerHTML = `${num1}`;
  num2 = Math.floor(Number(Tax)*0.9);
  const Profit = document.getElementById("profit");
  Profit.innerHTML = `${num2}`;
  });
}
window.addEventListener('load', item_price);