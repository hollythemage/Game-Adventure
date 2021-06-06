use Game::Adventure::Entity;

use Game::Adventure::LeftMove;
use Game::Adventure::RightMove;
use Game::Adventure::UpMove;
use Game::Adventure::DownMove;

use Game::Adventure::ImageLoopLibrary;

class Game::Adventure::Player is Game::Adventure::Entity {

      has $!lastmove;

      has $!leftmoveimageslib;
      has $!rightmoveimageslib;
      has $!upmoveimageslib;
      has $!downmoveimageslib;

      submethod BUILD(:$x, :$y, :$w, :$h, :$renderer) {
      		self.x = $x;
		self.y = $y;

		self.width = $w;
		self.height = $h;

		$!lastmove = Nil;

		self.zposition = 0; ### FIXME dispatch tilemap zpos

		$!leftmoveimageslib = Game::Adventure::ImageLoopLibrary();
		$!rightmoveimageslib = Game::Adventure::ImageLoopLibrary();
		$!upmoveimageslib = Game::Adventure::ImageLoopLibrary();
		$!downmoveimageslib = Game::Adventure::ImageLoopLibrary();
		### FIXME add images to image loop libs
		
		my $img = SDL2::Raw::SDL_LoadBMP("../../images/wizard1.bmp");
		my $image = SDL2::Raw::SDL_CreateTextureFromSurface($renderer, $img);
		$!leftmoveimageslib.addImage($image);
		$!rightmoveimageslib.addImage($image);
		$!upmoveimageslib.addImage($image);
		$!downmoveimageslib.addImage($image);
	}

	### main colliding method
	multi method collideRoom($room) {
	      $room.collidePlayer(self);
	}

	multi method undoMove() {
	  $!lastmove.undomove(self);    
	}

	multi method collideFloorXY($floordiamond) {
	      ### collide with Floor diamond
	      return Nil;
	}

	multi method getX() { return self.x; }
  	multi method getY() { return self.y; }
	multi method getWidth() { return self.width; }
  	multi method getHeight() { return self.height; }

	multi method getLastMove() { return $!lastmove; }

	multi method setXY($x, $y) { self.x = $x; self.y = $y; }

	multi method moveLeft() {
	      my $lmove = Game::Adventure::LeftMove.new();
	      $!lastmove = $lmove;
	      $lmove.move(self);
	}
	multi method moveRight() {
	      my $rmove = Game::Adventure::RighttMove.new();
	      $!lastmove = $rmove;
	      $rmove.move(self);
	}
	multi method moveUp() {
	      my $umove = Game::Adventure::UpMove.new();
	      $!lastmove = $umove;
	      $umove.move(self);
	}
	multi method moveDown() {
	      my $dmove = Game::Adventure::DownMove.new();
	      $!lastmove = $dmove;
	      $dmove.move(self);
	}

	multi method jump() {} ### FIXME
	multi method magiccrystal() {} ### FIXME

	multi method blit($renderer) {
	      my $destrect = SDL2::Raw::SDL_Rect.new(self.x, self.y + self.zposition, self.width, self.height); ### NOTE + $zposition

	      if ($!lastmove.^name == 'LeftMove') {
	      	 my $image = $!leftmoveimageslib.getImage();
		 SDL2::Raw::SDL_RenderCopy($renderer, $image, 0, $destrect);
	      }	elsif ($!lastmove.^name == 'RightMove') {
	      	 my $image = $!rightmoveimageslib.getImage();
		 SDL2::Raw::SDL_RenderCopy($renderer, $image, 0, $destrect);
	      } elsif ($!lastmove.^name == 'UpMove') {
	      	 my $image = $!upmoveimageslib.getImage();
		 SDL2::Raw::SDL_RenderCopy($renderer, $image, 0, $destrect);
	      } elsif ($!lastmove.^name == 'DownMove') {
	      	 my $image = $!downmoveimageslib.getImage();
		 SDL2::Raw::SDL_RenderCopy($renderer, $image, 0, $destrect);
	      }

	}

        multi method update() {

	}

}
      		
