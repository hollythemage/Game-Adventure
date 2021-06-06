use Game::Adventure::MainLoop;

use Game::Adventure::Player;
use Game::Adventure::AdventureRoom1;

use SDL2::Raw;

class Game::Adventure::SDL2MainLoop is Game::Adventure::MainLoop {

      has $!player;
      has $!currentroom;

      submethod BUILD(:$renderer) {
      		self.is_running = True;
		
		$!currentroom = Game::Adventure::AdventureRoom1.new($renderer);
		$!player = Game::Adventure::Player.new(100,100,24,24,$renderer);
	}

      ### compiler pattern for the main loop
      ### update and blit everything
      multi method loopOnce($renderer) {
      	    $!currentroom.update();
      	    $!currentroom.blit($renderer);
	    $!player.update();
	    $!player.blit($renderer);
      }

      multi method movePlayerLeft() {
	$!player.moveLeft();
        $!player.collideRoom($!currentroom);
      }
      multi method movePlayerRight() {
	$!player.moveRight();
        $!player.collideRoom($!currentroom);
      }
      multi method movePlayerUp() {
	$!player.moveUp();
        $!player.collideRoom($!currentroom);
      }
      multi method movePlayerDown() {
	$!player.moveDown();
        $!player.collideRoom($!currentroom);
      }
}
