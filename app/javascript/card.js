const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  Payjp.setPublicKey("pk_test_2b46cba882113dcdb3f5def2");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
   
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purcha_address[num]"),
      cvc: formData.get("purcha_address[cvc]"),
      exp_month: formData.get("purcha_address[month]"),
      exp_year: `20${formData.get("purcha_address[year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("purcha_address_num").removeAttribute("name");
      document.getElementById("purcha_address_cvc").removeAttribute("name");
      document.getElementById("purcha_address_month").removeAttribute("name");
      document.getElementById("purcha_address_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);
