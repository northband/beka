module Admin::ProductsHelper

  def view_image(image)
    link_to image_tag(image.photo.url(:small)), admin_product_image_path(image), :onclick => "this.blur(); Modalbox.show(this.href, {title: 'View Image', width: 600, overlayClose: true, evalScripts: true, slideDownDuration: .30}); return false;"
  end

end
