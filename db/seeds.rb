Article.delete_all
user = User.first
text = %{
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla congue lectus dictum, pulvinar sapien ut, porttitor enim. Nunc vehicula justo ac porta dapibus. Nullam odio nisl, pellentesque id lorem eget, malesuada ultricies eros. Cras consectetur mi et nisi lacinia elementum. Donec ac diam molestie, lacinia tortor sed, tempus magna. Suspendisse potenti. Sed egestas nisl sit amet luctus dapibus. Integer in mattis magna. Proin hendrerit cursus ipsum in fringilla. Sed ultricies ante nisi, vulputate cursus augue semper venenatis. Mauris mi arcu, ultrices ut tellus eu, euismod sodales enim. Nam et accumsan velit, vitae laoreet nisl.

Vestibulum lobortis iaculis justo, non maximus ipsum blandit at. Suspendisse potenti. Integer lacus lacus, accumsan vitae varius vel, dapibus vitae lectus. Integer ligula lectus, facilisis ac dapibus a, vulputate id massa. Nam ut ipsum at tellus tincidunt efficitur pretium nec leo. Quisque a consectetur lacus, vitae lobortis nisi. Morbi ac porttitor arcu. Fusce et ligula quis quam laoreet ullamcorper eu ut dolor. Vestibulum arcu ante, condimentum vel velit eu, congue scelerisque dolor. Curabitur sit amet pulvinar dolor. Donec auctor fringilla elit, sit amet sagittis risus tristique ut.

Maecenas porta auctor urna, suscipit luctus massa sollicitudin id. Mauris id tincidunt libero, at volutpat magna. Donec luctus ipsum sed turpis vehicula convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pellentesque magna at eleifend laoreet. Aenean elementum et dolor at feugiat. Nam convallis interdum eros, ut commodo augue auctor ut. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla facilisi. Ut magna libero, sodales at eleifend nec, vestibulum non lacus.

Phasellus metus nunc, maximus vitae malesuada facilisis, dictum nec leo. Suspendisse finibus non velit maximus pulvinar. Fusce consequat lobortis justo sit amet condimentum. Quisque egestas porta nisl a dignissim. Nullam non velit eu diam hendrerit cursus nec nec elit. Donec magna mi, pharetra vitae nisi in, feugiat volutpat diam. Suspendisse interdum tempus ipsum efficitur pharetra. In at molestie erat. Cras vehicula, eros nec ullamcorper venenatis, mauris lectus viverra massa, et laoreet mauris elit nec turpis. Morbi feugiat justo tortor, ut laoreet libero vulputate vitae. Morbi non dolor in augue tempus posuere. Curabitur luctus fermentum ipsum, quis eleifend leo ultricies eu. Praesent at diam a tortor efficitur condimentum vitae at nisi. Morbi tincidunt lacus enim, nec vestibulum risus mollis et. Pellentesque placerat nisl id porttitor lobortis. Sed convallis consequat sapien in ornare.

Proin eros elit, aliquet quis justo et, volutpat pellentesque enim. Maecenas maximus libero lorem, non interdum massa posuere vel. Vivamus ac dui bibendum, dapibus nunc eget, sodales felis. Donec gravida enim hendrerit ipsum sollicitudin fermentum. Aenean non lorem at lacus porttitor sodales quis vel sem. Ut luctus mattis dui, et vulputate purus varius at. Curabitur a venenatis turpis. Nullam vel metus vestibulum, molestie magna pulvinar, mattis magna. Quisque eget nisi justo. Vivamus ut hendrerit elit, aliquet blandit justo. Duis magna justo, sagittis sed placerat at, vestibulum eget ante. Donec eget orci nec dolor finibus aliquam. Phasellus neque eros, porttitor at augue eget, auctor bibendum justo. Sed ut suscipit lorem. 
}

p 'Iniciando'
  Category.all.each do |category|
    30.times do
      Article.create!(
        title: "Article#{rand(10000)}",
        body: text,
        category_id: category.id,
        user_id: user.id,
        created_at: rand(365).days.ago
      )
    end
  end
p 'Terminou'