class Game::Adventure::Room {

      has $!tilemap;
      has @!entities;
 
       submethod BUILD() {
      		
	}

       multi method addEntity($e) {
		@!entities.push($e);
	}

	multi method blit($renderer) {
	      $!tilemap.blit($renderer);
	      for @!entities -> $e {
		     $e.blit($renderer);
		     }
	}

	multi method collidePlayer($player) {
	}

        multi method update() {
	      for @!entities -> $e {
		     $e.update();
		     }
	}

}
