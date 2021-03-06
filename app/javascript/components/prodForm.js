export const initProdForm = () => {
  const featureBtn = document.getElementById('feature-btn')
  if (!featureBtn) return

  featureBtn.addEventListener('click', (e) => {
    const inputs = `<div class="form-inline justify-content-around mb-3">
                      <div class="form-group string optional product_feature_key"><label class="string optional mx-1" for="product_feature_key">Key</label><input class="form-control string optional contact-input m-0" name="product[features][][key]" type="text" id="product_feature_key"></div>
                      <div class="form-group string optional product_feature_value"><label class="string optional mx-1" for="product_feature_value">Value</label><input class="form-control string optional contact-input m-0" name="product[features][][value]" type="text" id="product_feature_value"></div>
                      <button type="button" onclick="this.parentElement.remove()" class="btn btn-danger">Delete</button>
                    </div>`
    e.currentTarget.insertAdjacentHTML('beforebegin', inputs)
  })
}
