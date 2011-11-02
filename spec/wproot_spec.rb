require 'spec_helper'

describe WPRoot do
  it "should have a version" do
    WPRoot::VERSION.should be_a(String)
  end

  it "should evaluate haml code" do
    haml = WPRoot::Haml.new <<HAML
!!! 5
%html
  %body
    %header
    #content
      %p= 0
      %ul
        %li
          - f($x)
    %footer 1
HAML

    haml.compile.should eq(<<HTML
<!DOCTYPE html>
<html>
  <body>
    <header></header>
    <div id="content">
      <p><?php echo 0 ?></p>
      <ul>
        <li>
          <?php f($x) ?>
        </li>
      </ul>
    </div>
    <footer>1</footer>
  </body>
</html>
HTML
)
  end
  it "should evaluate compass/sass code" do
    compass = WPRoot::Compass.new <<SASS
import css3
body
  section
    background: darken(white, 100%)
    &:hover
      background: linear-gradient(white, black)
SASS

    compass.compile.should eq(<<CSS
body section {
  background: black; }
  body section:hover {
    background: linear-gradient(#ffffff, #000000); }
CSS
)
  end
end
