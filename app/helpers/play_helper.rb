module PlayHelper
  def generate_choice(hash)
    return if hash[:title] == 'It\'s a Draw!'
    link_to image_tag(image_path("#{hash[:choice]}.svg"), height: "75"),
                      play_choose_path(choice: hash[:choice]), title: hash[:choice]
  end
end
