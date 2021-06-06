class Game::Adventure::Move {

      has $!dx;
      has $!dy;

      submethod BUILD(:$dx, :$dy) {
      		$!dx = $dx;
		$!dy = $dy;
      }

      multi method move($player) {
      	    $player.setXY($player.getX() += $!dx, $player.getY() += $!dy);
      }

      multi method undomove($player) {
      	    $player.setXY($player.getX() -= $!dx, $player.getY() -= $!dy);
      }
}
