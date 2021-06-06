use Game::Adventure::Move;

class Game::Adventure::DownMove is Game::Adventure::Move {

      submethod BUILD() {
      		self.dx = -1;
		self.dy = 1;
      }

}
