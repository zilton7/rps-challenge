module PlayHelper
  def generate_choice(choice_type)
    link_to image_tag(image_path("#{choice_type}.svg"), height: "75"),
                      play_choose_path(choice: choice_type), title: choice_type
  end
end
