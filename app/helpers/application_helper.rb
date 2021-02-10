module ApplicationHelper
  include Pagy::Frontend

  NAVBAR_CURRENT_PAGE = "px-3 py-2 text-sm font-medium text-white bg-gray-900 rounded-md"
  NAVBAR_OTHER_PAGE = "px-3 py-2 text-sm font-medium text-gray-300 rounded-md hover:bg-gray-700 hover:text-white"

  def navbar_link(link, text)
    link_to text, link, class: current_page?(link) ? NAVBAR_CURRENT_PAGE : NAVBAR_OTHER_PAGE
  end
end
