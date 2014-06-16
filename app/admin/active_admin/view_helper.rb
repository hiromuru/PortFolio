module
ActiveAdmin::ViewHelpers
  def my_helper(sculp)
    sculp.images.each do |img|
      puts img.image.url.to_s
    end
    
  end

end