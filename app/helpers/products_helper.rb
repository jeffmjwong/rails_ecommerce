module ProductsHelper

  def display_avg_rating(avg_rating)
    if avg_rating.nan?
      content_tag(:div, content_tag(:p, "No ratings available"), class: "product-average-rating-container")
    else
      content_tag(:div, class: "product-average-rating-container") do
        concat content_tag(:p, "Average rating")
        concat content_tag(:p, "#{sprintf('%.1f', avg_rating)} out of 5")
      end
    end
  end

end
