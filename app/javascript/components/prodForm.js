export const initProdForm = () => {
  const featureBtn = document.getElementById('feature-btn')
  if (!featureBtn) return

  featureBtn.addEventListener('click', (e) => {
    const inputs = `<div class="form-inline justify-content-around">
                      <div class="form-group string optional product_feature_key"><label class="string optional" for="product_feature_key">Key</label><input class="form-control string optional" name="product[features][][key]" type="text" id="product_feature_key"></div>
                      <div class="form-group string optional product_feature_value"><label class="string optional" for="product_feature_value">Value</label><input class="form-control string optional" name="product[features][][value]" type="text" id="product_feature_value"></div>
                      <button type="button" onclick="this.parentElement.remove()">Delete</button>
                    </div>`
    e.currentTarget.insertAdjacentHTML('beforebegin', inputs)
  })
}
