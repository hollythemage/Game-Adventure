use SDL2::Raw;

### looping through images for animation

class ImageLoopLibrary {

      has @!images; ### contains SDL2 textures
      has $!index;

      submethod BUILD() {
      		@!images = ();
		$!index = 0;
      }

      method addImage($tex) {
	     @!images.push($tex);
      }

      method getImage() {
      	     if ($!index >= @!images.elems) {
	     	$!index = 0;
	     }
      	     return @!images[$!index++];
      }
}
