const pay = () => {
  // テスト公開鍵を設定
  Payjp.setPublicKey(process.env.FURIMA_PUBLIC_KEY);

  // トークン発行のための処理
  const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_destination[number]"),
      exp_month: formData.get("order_destination[exp-month]"),
      exp_year: `20${formData.get("order_destination[exp-year]")}`,
      cvc: formData.get("order_destination[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id
        
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      };

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);