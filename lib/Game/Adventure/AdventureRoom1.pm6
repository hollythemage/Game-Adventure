use Game::Adventure::AdventureRoom;

use SDL2::Raw;

### use Game::Adventure::Goon1;

### The room for blitting a constant background and adding game entities

class Game::Adventure::AdventureRoom1 is Game::Adventure::AdventureRoom {


       submethod BUILD() {
      		self.background-image = SDL2::Raw::SDL_LoadBMP("../../images/bg-room-1.bmp");	
		### self.addEntity(Game::Adventure::Goon1(100,100,48,48,0));

	}

	multi method blit($renderer) {
	      my $destrect = SDL2::Raw::SDL_Rect.new(self.x,self.y,1024,768); ### QueryTexture width height
	      my $image = SDL2::Raw::SDL_CreateTextureFromSurface($renderer, self.background-image);
	      SDL2::Raw::SDL_RenderCopy($renderer, $image, 0, $destrect);
	}

        multi method update() {

	}

	multi method collidePlayer($player) {
	    return Nil;
	}
}
