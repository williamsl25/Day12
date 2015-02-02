# Day12
<!-- HAML -->
1. add gemfile 
gem 'haml-rails'
2. in terminal go out of server then back in
3. bundle install
4. rails s
5. in sublime - welcome - new file index.html.haml
example

Welcome Index
%div.row
  %div.col-md-8
    %h1.hello_world.end_of_the_world#this_is_an_id{ class: "#{@new_class}" }
      Foooooood
      is good
      %small
        is awesome
    down here
    %span{ class: "glyphicon glyphicon-search" }
    = Rails.root
    %span.glyphicon.glyphicon-phone
    %span.glyphicon.glyphicon-menu-down
    %div
      This is some cool text.

    = link_to "Restaurant List", restaurants_path
    %br
    = link_to "Food List", foods_path
    %br

    - if @array.length > 3
      Good morning
      %strong sunshine.

    - @array.each do |arr|
      = arr.inspect


    %a.btn.btn-success
      Robbi's Link

  %div.col-md-4
    %img{ src: "/assets/magic.gif" }
    = image_tag "magic.gif", class: "img-circle"
    = image_tag "funny_images/sup_foo.jpg"

%div.row
  %div.col-md-4.col-md-offset-2
    Hello 1
  %div.col-md-4
    Hello 2
  %div.col-md-5.col-md-offset-1
    Hello 3
  %div.col-md-6
    Hello 4

Form page:
_form.html.haml

= form_for(@restaurant) do |f|
  - if @restaurant.errors.any?
    - @restaurant.errors.full_messages.each do |message|
      = message
      %br
  .field
    = f.label :name
    %br
      = f.text_field :name
  .field
    = f.label :description
    %br
      = f.text_area :description
  .field
    = hidden_field_tag 'restaurant[food_ids][]', ''
    - @foods.each do |food|
      = check_box_tag 'restaurant[food_ids][]', food.id, @restaurant.foods.include?(food)
      = food.name
      %br
  .actions
    = f.submit