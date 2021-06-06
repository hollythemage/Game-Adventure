class Game::Adventure::Entity {

      has $!x;
      has $!y;
      has $!width;
      has $!height;
      has $!zposition;

      submethod BUILD(:$x, :$y, :$w, :$h, :$zpos) {
      		$!x = $x;
		$!y = $y;

		$!width = $w;
		$!height = $h;

		$!zposition = $zpos;
	}

	multi method blit($renderer) {

	}

	multi method update() {

	}
}
      		
